Profile: CVRIdentifier
Parent: Identifier
Id: dk-core-cvr-identifier
Title: "Danish Central Business Register (CVR) Identifier"
Description: "Identifier holding a danish [CVR](https://datacvr.virk.dk/data/) number."
* use = #official (exactly)
* system 1..
* system = "http://cvr.dk" (exactly)
* value 1..
  * obeys CVR-length and CVR-modulus-11

Invariant: CVR-length
Description: "CVR must be exactly 8 numeric characters long"
Severity: #error
Expression: "matches('^[0-9]{8}$')"

Invariant: CVR-modulus-11
Description: "CVR must pass the modulus 11 check"
Severity: #error
Expression: "((\n    (substring(0,1).toInteger()*2)+\n    (substring(1,1).toInteger()*7)+\n    (substring(2,1).toInteger()*6)+\n    (substring(3,1).toInteger()*5)+\n    (substring(4,1).toInteger()*4)+\n    (substring(5,1).toInteger()*3)+\n    (substring(6,1).toInteger()*2)+\n    (substring(7,1).toInteger()*1)) mod(11)=0)"