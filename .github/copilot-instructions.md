# DK Core - Copilot Instructions

## Repository Overview

**DK Core** is a FHIR Implementation Guide (IG) for Denmark, defining core FHIR profiles, extensions, code systems, and value sets for use across Danish healthcare sectors. This repository is maintained by HL7 Denmark and serves as the foundational specification for Danish FHIR implementations.

- **Type**: FHIR Implementation Guide
- **Language**: FSH (FHIR Shorthand) + Markdown documentation
- **Size**: ~1.8MB (25 FSH files, ~4,300 lines of FSH code)
- **Primary Tools**: HL7 FHIR IG Publisher (Java-based), FSH (embedded in publisher)
- **FHIR Version**: 4.0.1
- **Dependencies**: hl7.fhir.uv.phd (1.1.0), hl7.fhir.uv.ipa (1.0.0)

## Key Repository Information

### What This Repository Does
- Defines Danish core FHIR profiles (Patient, Organization, Practitioner, Observation, etc.)
- Provides Danish-specific extensions, code systems, and value sets
- Includes CPR (Danish civil registration), SOR (healthcare organization registry), and other Danish identifiers
- Offers both standard DK profiles and IPA-compliant profiles for patient-facing applications
- Published at http://hl7.dk/fhir/core/ and https://hl7dk.github.io/dk-core/

### Primary Governance
- Approved by HL7 Denmark
- Regularly reviewed by Danish FHIR SIG (meets every odd week on Mondays 15:00-16:00)
- Submitted to Danish Health Data Authority after HL7 Denmark approval

## Build and Validation Process

### Prerequisites
- **Java**: OpenJDK 17+ required (tested with OpenJDK 17.0.17)
- **Memory**: At least 3.5GB RAM for Java heap
- **Internet**: Required for downloading publisher and terminology server access (tx.fhir.org)
- **File Encoding**: UTF-8 (set via JAVA_TOOL_OPTIONS)

### Build Steps

#### 1. Update/Download the IG Publisher (Required First Time)
```bash
./_updatePublisher.sh -y
```
This downloads the latest IG Publisher (~100MB) to `input-cache/publisher.jar`. On Windows, use `_updatePublisher.bat`. The script also updates build scripts from the HL7 repository.

**Important**: This requires internet connectivity to tx.fhir.org. If offline, the build will operate in offline mode with limited terminology validation.

#### 2. Build the Implementation Guide
```bash
./_genonce.sh
```
On Windows, use `_genonce.bat`.

**What this does**:
- Automatically compiles FSH files to FHIR JSON resources
- Validates all resources against FHIR spec and dependencies
- Generates the HTML implementation guide
- Runs terminology validation (if online)
- Outputs to `./output/` directory

**Build Time**: 5-15 minutes depending on system and network speed.

**Memory Configuration**: The build uses `-Xms3550m -Xmx3550m` for Java heap. If you encounter OutOfMemory errors, increase these values in the `_genonce.sh/bat` scripts.

#### 3. Continuous Build (Optional for Development)
```bash
./_gencontinuous.sh
```
This runs the publisher in watch mode, automatically rebuilding when FSH files change.

### Common Build Issues and Solutions

**Issue**: "IG Publisher NOT FOUND"
- **Solution**: Run `./_updatePublisher.sh -y` first

**Issue**: "Offline (or the terminology server is down)"
- **Solution**: This is informational. Build will continue in offline mode with `-tx n/a` option. Terminology validation will be limited.

**Issue**: Java OutOfMemoryError
- **Solution**: Increase Java heap size in `_genonce.sh`: change `-Xms3550m -Xmx3550m` to higher values (e.g., `-Xms4096m -Xmx4096m`)

**Issue**: Build warnings about property definitions in CodeSystem
- **Solution**: These warnings are expected and suppressed in `input/ignoreWarnings.txt`. They relate to NPU terminology properties.

**Issue**: Build warnings about LOINC display names
- **Solution**: Expected - Danish translations for some LOINC codes are not available. These are suppressed in `input/ignoreWarnings.txt`.

### Validation

The IG Publisher automatically validates:
- FSH syntax correctness
- FHIR resource conformance to base FHIR spec
- Profile constraints (invariants, cardinality, bindings)
- Terminology bindings (when online)
- Cross-references between resources

**Known Suppressed Warnings**: See `input/ignoreWarnings.txt` for intentionally suppressed warnings related to:
- Medical device whitespace in examples
- NPU CodeSystem properties
- Missing terminology definitions (NPU, MedCom, SKS codes not available at terminology server)
- LOINC display name translations

### Testing

This repository does not include automated unit tests. Validation occurs through:
1. IG Publisher build validation
2. GitHub Actions CI build (see `.github/workflows/main.yml`)
3. Manual review by HL7 Denmark FHIR SIG

## Project Layout

### Root Directory Files
```
├── README.md                    # Basic repository information and build instructions
├── sushi-config.yaml           # Main IG configuration (metadata, dependencies, menu)
├── ig.ini                      # IG Publisher configuration (template, IG path)
├── release-notes.md            # Version history and changes
├── publication-request.json    # Publication metadata for HL7 registry
├── _updatePublisher.sh/.bat    # Script to download/update IG Publisher
├── _genonce.sh/.bat           # Script to build IG once
├── _gencontinuous.sh/.bat     # Script to build IG in watch mode
└── build-notes.txt            # Developer notes on publishing process
```

### Input Directory Structure
```
input/
├── fsh/                        # FSH source files (all profiles, extensions, terminology)
│   ├── DkCorePatient.fsh      # Patient profile
│   ├── DkCoreOrganization.fsh # Organization profile
│   ├── DkCoreObservation.fsh  # Observation profiles
│   ├── DkCorePractitioner.fsh # Practitioner profile
│   ├── aliases.fsh            # FHIR aliases for common URLs
│   ├── codeSystems.fsh        # Danish code systems
│   ├── valueSets.fsh          # Danish value sets
│   ├── extensions.fsh         # Danish extensions
│   ├── instances.fsh          # Example instances and NamingSystems
│   ├── IPAProfiles.fsh        # IPA-compliant profiles
│   └── *Identifier.fsh        # Various identifier profiles (CPR, SOR, etc.)
├── pagecontent/               # Markdown content for IG pages
│   ├── index.md              # IG home page
│   ├── guidance.md           # Design guidance
│   ├── downloads.md          # Download links page
│   ├── StructureDefinition-*.md  # Profile documentation
│   ├── profiles.xml          # Profile list page template
│   ├── terminology.xml       # Terminology list page template
│   └── extensions.xml        # Extension list page template
├── images/                    # Images for documentation (currently just placeholder)
└── ignoreWarnings.txt        # Validation warnings to suppress
```

### Generated Directories (Gitignored)
```
├── fsh-generated/             # FSH compiler output (FHIR JSON resources)
├── output/                    # Final IG HTML and resources
├── input-cache/               # Downloaded IG Publisher and dependencies
├── temp/                      # Temporary build files
├── template/                  # Downloaded IG template
└── txCache/                   # Terminology server cache
```

## GitHub Workflows

### CI Build (`.github/workflows/main.yml`)
Triggers on:
- Push to `main` or `master` branches
- Pull requests to `main` or `master` branches
- Manual workflow dispatch

Build Process:
1. Checkout repository
2. Download latest IG Publisher using Docker (`hl7fhir/ig-publisher-base:latest`)
3. Run IG Publisher: `java -jar ./input-cache/publisher.jar publisher -ig .`

**Note**: The deployment step is currently commented out. The IG is built but not automatically published to GitHub Pages.

**Build Time in CI**: Typically 10-20 minutes

## Making Changes

### Editing FSH Files
All FHIR definitions are in `input/fsh/*.fsh` files. Common patterns:

**Profile Structure**:
```fsh
Profile: DkCorePatient
Parent: Patient
Id: dk-core-patient
Title: "Danish Core Patient Profile"
Description: "HL7 Denmark core profile for a patient"
* identifier 1..
* identifier ^slicing...
```

**Code System Structure**:
```fsh
CodeSystem: DkCoreProfessionGroupCodes
Id: DkCoreProfessionGroupCodes
Title: "DK Profession Group Codes"
Description: "..."
* ^experimental = false
* ^status = #active
* #C511 "Ambulancebehandler"
```

### Adding New Profiles
1. Create a new `.fsh` file in `input/fsh/`
2. Define the profile using FSH syntax
3. Optionally add markdown documentation in `input/pagecontent/StructureDefinition-{id}-intro.md`
4. Build with `./_genonce.sh` to validate

### Editing Documentation
- Main content: `input/pagecontent/index.md`
- Profile-specific: `input/pagecontent/StructureDefinition-{profile-id}-intro.md`
- Guidance: `input/pagecontent/guidance.md`

### Configuration Changes
- IG metadata: Edit `sushi-config.yaml` (version, title, dependencies, menu)
- Template: Edit `ig.ini` (rarely needed)
- Ignored warnings: Edit `input/ignoreWarnings.txt`

## Important Notes

### Always Trust These Instructions First
These instructions document the canonical build process. Only search for additional information if something here is incomplete or incorrect.

### File Encoding
Always use UTF-8 encoding. The build scripts set `JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8` automatically.

### Danish vs. English
- Primary language is English
- Danish terms used where no English equivalent exists
- Danish terms/explanations prefixed with 'Da' or '[DA]'
- Comments in FSH files often include both languages

### Terminology Considerations
- NPU, MedCom, and SKS code systems are Danish-specific and may not resolve at the international terminology server
- LOINC and SNOMED CT require proper copyright notices (see `input/pagecontent/index.md`)

### Version Management
- Version defined in `sushi-config.yaml`
- Status should be 'draft' for CI builds, 'active' for releases
- Release label should be 'ci-build' for CI, 'release' for official releases

### Do Not Modify
- `.github/agents/` directory (if present) - contains instructions for other agents
- Build scripts (`_*.sh`, `_*.bat`) unless updating from HL7 official scripts
- `input-cache/`, `output/`, `fsh-generated/`, `temp/`, `template/`, `txCache/` - all generated

### Offline Development
The build can run offline but with limited terminology validation. The build scripts automatically detect connectivity to tx.fhir.org and adjust.

## Quick Reference

**Build IG**: `./_genonce.sh`
**Update Publisher**: `./_updatePublisher.sh -y`
**Watch Mode**: `./_gencontinuous.sh`
**View Output**: Open `output/index.html` in browser after build
**Check Validation**: Review `output/qa.html` for validation issues
