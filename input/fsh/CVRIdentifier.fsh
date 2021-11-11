Profile: CVRIdentifier
Parent: Identifier
Id: dk-core-cvr-identifier
Title: "Danish Official Company Number"
Description: "Identifier holding an official company number"
* ^status = #draft
* use = #official (exactly)
* system 1..
* system = "http://cvr.dk" (exactly)
* value 1..
* value obeys CVR-length and CVR-modulus-11

Invariant:   CVR-length
Description: "CVR must be exactly 8 numeric characters long"
Expression:  "value.matches('^[0-9]{8}$')"
Severity:    #error

Invariant:   CVR-modulus-11
Description: "CVR must pass the modulus 11 check"
Expression:  "((
    (value.substring(0,1).toInteger()*2)+
    (value.substring(1,1).toInteger()*7)+
    (value.substring(2,1).toInteger()*6)+
    (value.substring(3,1).toInteger()*5)+
    (value.substring(4,1).toInteger()*4)+
    (value.substring(5,1).toInteger()*3)+
    (value.substring(6,1).toInteger()*2)+
    (value.substring(7,1).toInteger()*1)) mod(11)=0)"
Severity:    #error
