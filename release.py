import requests
import json
import base64
from requests.auth import HTTPBasicAuth
import os
import os.path
from pprint import pprint
import xml.etree.ElementTree as ET
import configparser
import xmltodict
from shutil import copytree, ignore_patterns, copyfile, rmtree
#from github import Github

skip_1_build = False # Set to True for skip the initial IG build for a few seconds/minutes faster debugging
keep_release_token = False # Normally False. Keep the release JSON token True to be able to run this script several times without havint to restore the token


publishini = configparser.ConfigParser()
igini = configparser.ConfigParser()
use_git_submodules = False


### 1. Set defaults and extract variables
webrootfolder = 'www'
ig_source_repo = ''
ig_source_folder = ''
#org = 'JCT'
#ig_title = "My FHIR profiles"


# load release token if any exists
print('\n### Opening the release token')
if (not(os.path.exists(os.path.join('.','release.json')))):
    print('Release Token (release.json) does not exist. Nothing to do')
    exit(1)

with open(os.path.join('.','release.json')) as fd:
    release = json.load(fd)     


igrootfolder = os.path.join('..',release['ig'])

# Variable: release.json.history-template / Default HL7

ig_intro = release.get("intro")
ig_category = release.get("ig_category")
ci_url = release.get("ci_url")
org = release.get("org")
#ci_url = "http://build.fhir.org/ig/costateixeira/testrel/"



if (ig_source_repo!=''):
    igrootfolder = ig_source_repo[ig_source_repo.rindex('/')+1:]


#history_template_repo ='https://github.com/HL7/fhir-ig-history-template.git'
#history_template_repo ='https://github.com/IHE/fhir-ig-history-template.git'
#history_template_repo ='https://github.com/hl7-be/fhir-ig-history-template.git'
#history_template_repo ='https://github.com/openhie/fhir-ig-history-template.git'

history_template_repo = release['history_template_repo']

ig_registry_repo = 'https://github.com/FHIR/ig-registry.git'


#### 1.1 ask user for missing variables

#if (webrootfolder==''):
#  webrootfolder = input("Web publication root folder (typically 'www' or 'website'): ")   
if (webrootfolder==''):
  webrootfolder = 'www'   
print("Web publication root folder: "+webrootfolder+"\n")


# Check if there is an input folder, and if not, a repo to clone
if (igrootfolder==''):
  if (ig_source_repo!=''):
      igrootfolder = ig_source_repo[ig_source_repo.rindex('/')+1:]
      if (not(os.path.exists(igrootfolder))):
        os.system('git clone '+ig_source_repo+' '+igrootfolder)
  else:
      print("No source or repository to start. Please indicate the IG root folder (relative path)")
      igrootfolder = input("IG root folder to be used: ")   



# Check if there is an IG in the input folder
print("IG root folder: "+igrootfolder+"\n")
if ((igrootfolder=='') or (not(os.path.exists(igrootfolder)))):
    print("IG root folder not given or not found, aborting: "+igrootfolder+"\n")
    exit(1)



igini_filename = os.path.join('.',igrootfolder, 'ig.ini')
igini.read(igini_filename)
try:
  ig_filename = igini['IG']['ig']
except:
  print("ig.ini not found or empty. Aborting.")
  exit(1)
print(ig_filename)




# open IG as dict from the file
file_name, file_extension = os.path.splitext(ig_filename)
if (file_extension == '.xml'):
    with open(os.path.join(igrootfolder,ig_filename)) as fd:
        ig2 = xmltodict.parse(fd.read())
        ig = ig2['ImplementationGuide']
else:
    with open(os.path.join(igrootfolder,ig_filename)) as fd:
      ig = json.load(fd)     

# extract values from the IG
if (file_extension == '.xml'):
# Variable: ig.xml.id
    ig_id = str(''.join(ig['id'].values()))
    if ('title' in ig):
        ig_title = str(''.join(ig['title'].values()))
# Variable: ig.xml.title
# Variable: ig.xml.url
# Variable: ig.xml.version
# Variable: ig.xml.titlepackage_id
# Variable: ig.xml.fhir_version
    ig_url = str(''.join(ig['url'].values()))
    ig_version = str(''.join(ig['version'].values()))
    ig_package_id = str(''.join(ig['packageId'].values()))
    ig_fhir_version = str(''.join(ig['fhirVersion'].values()))
else:
    ig_id = str(''.join(ig['id']))
    if ('title' in ig):
        ig_title = str(''.join(ig['title']))
    ig_url = str(''.join(ig['url']))
    ig_version = str(''.join(ig['version']))
    ig_package_id = str(''.join(ig['packageId']))
    ig_fhir_version = str(''.join(ig['fhirVersion']))


#get base and canonical by splitting the ig url before and after the id 
url_data = ig_url.split(ig_id)

#checks
## url_data[2] must exist
if url_data[2] != '':
    exit(1)
base = url_data[0]
ig_canonical = url_data[0]+ig_id

# init a package_list dict
new_package_list = {
  'package-id': ig_package_id,
  'title': ig_title,
  'canonical': ig_canonical,
  'introduction': ig_intro,
  'category': ig_category,
  "list": [
    {
      "version": "current",
      "desc": "Continuous Integration Build",
      "path": ci_url,
      "status": 'ci-build',
      "current": True
    }
  ]
}



# 1.3 setup the submodules
if os.path.exists('fhir-ig-history-template'):
  print('History template already exists.')
else:
  if use_git_submodules:
    print('\n### Adding history template as submodule')
    os.system('git submodule add '+history_template_repo+' fhir-ig-history-template')
  else:
    print('\n### Cloning history template')
    os.system('git clone '+history_template_repo+' fhir-ig-history-template')


if os.path.exists('ig-registry'):
  print('IG Registry already present.')
else:
  if use_git_submodules:
    print('\n### Adding IG registry as submodule')
    os.system('git submodule add '+ig_registry_repo+' ig-registry')
  else:
    print('\n### Cloning IG registry')
    os.system('git clone '+ig_registry_repo+' ig-registry')


os.chdir(igrootfolder)
print(os.getcwd())


# Try and build the IG
if not(skip_1_build):
  print('\n### Running the publisher to see if everything is ok')
  result = os.system('java -jar ./input-cache/publisher.jar -ig ig.ini') 
  if (result!=0):
      print('Error: IG publication process not successful. Check the IG')
      exit(2)

  print('\n### Publisher ran ok')



#3.5
print('\n### Running the publisher to prepare the current version for publishing')
os.system('java -jar ./input-cache/publisher.jar -ig ig.ini -publish '+ig_canonical+'/'+ig_version)


#1.2 create webroot folder
print('\n### Creating the web root folder')
if (not(os.path.exists(webrootfolder))):
#  os.mkdir(webrootfolder)
  os.makedirs(os.path.join(webrootfolder), exist_ok=True)

#os.system('xcopy /s /y ..\\\\* ' + os.path.join(webrootfolder,''))
copytree(os.path.join('.','fhir-ig-history-template'), os.path.join(webrootfolder),dirs_exist_ok=True, ignore=ignore_patterns('.git', 'package-list.json'))  





print('\n### Reading and checking publish.ini')
## Read and fix publish.ini
piinifilename=(os.path.join(webrootfolder, 'publish.ini'))
if (os.path.exists(piinifilename)):
    publishini.read(piinifilename)
    if (publishini['website']['url'] != ig_canonical):
        print ("URL in ig.ini does not match that of the IG")
        exit(7)
else:
    publishini.read_string("""
    [website]
    style = fhir.layout
    server = apache
    url = x
    org = y
    no-registry = 1

    [feeds]
    package = package-feed.xml
    publication = publication-feed.xml
    """)
    publishini['website']['url'] = ig_canonical
    publishini['website']['org'] = org
    with open(os.path.join('.',webrootfolder, 'publish.ini'), 'w') as inifile:
        publishini.write(inifile)

rebuildpackagelist = False
# check if package-list exists, and if not (or if it is the default), create a new one

if os.path.exists(os.path.join('.',webrootfolder,'package-list.json')):
    print('package-list already exists, loading')
    with open(os.path.join('.',webrootfolder,'package-list.json')) as fd:
      package_list = json.load(fd) 
      if package_list['canonical']=='url':
        package_list = new_package_list
else:
    package_list = new_package_list.copy()        
    with open(os.path.join('.',webrootfolder,'package-list.json'), 'w') as outfile:
        json.dump(package_list, outfile, indent=2)



if (release['ig'] != ig_id):
    print('Error: IG ID in the release token does not match the IG. Aborting.')
    exit(5)
if (release['version'] != ig_version):
    print('Error: IG version in the release token does not match the IG. Aborting.')
    exit(5)
release.pop('ig')

release['path'] = ig_canonical+'/'+ig_version
release['fhirversion'] = ig_fhir_version
release['current'] = True






# Fix PackageList
## remove releasescurrent
print('\n### Checking and fixing package-list.json')
for rel in package_list['list']:
    if (rel['status']!='ci-build'):
        rel['current']= False
release_exists = False
for rel in package_list['list']:
    if (rel['version']==ig_version):
        release_exists = True
        rel.update(release)        
if not(release_exists):
    package_list['list'].append(release.copy())
else:
    print('')
    reply = str(input('\n### Release already exists. Continue (y/n)? ')).lower().strip()
    if reply[:1] != 'y':
        print('Canceling.')
        exit(0)

## write package-list
print('\n### writing package-list.json')
with open(os.path.join('.',webrootfolder,'package-list.json'), 'w') as outfile:
    json.dump(package_list, outfile, indent=2)




#3.8 check if the release folder is already there
print('\n### Checking if the release folder already exists')
if (not(os.path.exists(os.path.join('.',webrootfolder,ig_version) ))):
  os.makedirs(os.path.join('.',webrootfolder,ig_version))
else:
    print('')
    reply = str(input('\n### Release folder already exists. Continue (y/n)? ')).lower().strip()
    if reply[:1] != 'y':
        print('\n### Canceling.')
        exit(0)
    else:
        rmtree(os.path.join('.',webrootfolder,ig_version))
        os.mkdir(os.path.join('.',webrootfolder,ig_version))
##### this must really be fixed. set vars and then do stuff.




#3.7 
#os.system('xcopy /s /y output ' + webrootfolder )
print('\n### Copying the built ig to the root publication folder')
copytree('output', os.path.join(webrootfolder,''),dirs_exist_ok=True, ignore=ignore_patterns('.git'))  



#os.system('xcopy /s /y output ' + os.path.join('.',webrootfolder,ig_version,'' ))
print('\n### Copying the built ig to the corresponding publication folder')
copytree('output', os.path.join(webrootfolder,ig_version,''),dirs_exist_ok=True, ignore=ignore_patterns('.git'))  


#3.9
print('\n### Running the publication update procedure')
#os.system('java -jar ..\publisher.jar -publish-update -folder '+ webrootfolder+ ' -registry ../ig-registry/fhir-ig-list.json -history ../fhir-ig-history-template -noconfirm')

print('java -jar ./input-cache/publisher.jar -publish-update -folder '+ webrootfolder +  ' -registry ./ig-registry/fhir-ig-list.json -history ./fhir-ig-history-template -noconfirm')
os.system('java -jar ./input-cache/publisher.jar -publish-update -root . -folder '+ webrootfolder  + ' -registry ./ig-registry/fhir-ig-list.json -history ./fhir-ig-history-template -noconfirm')


#3.10
#os.system('xcopy /s /y www\\assets www\\assets-hist')
print('### Copying the ig template to the history template')
destination = copytree(os.path.join(webrootfolder,'assets'), os.path.join(webrootfolder,'assets-hist'),dirs_exist_ok=True, ignore=ignore_patterns('.git'))

#print(json.dumps(package_list, indent=2))

if (keep_release_token):
  # remove / rename the release token file
  print('\n### Removing the release token file')
  if os.path.exists(os.path.join('..','release.json')):
      copyfile(os.path.join('.','release.json'), ('../'+'release-'+ig_version+'.json'))
      os. remove(os.path.join('.','release.json'))

exit(0)


