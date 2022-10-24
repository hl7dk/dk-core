Profile: GLNIdentifier
Parent: Identifier
Id: dk-core-gln-identifier
Title: "GLN Identifier"
Description: "Identifier holding a 13 digit GLN"
* ^status = #draft
* use = #official (exactly)
* system 1..
* system = "https://www.gs1.org/gln" (exactly)
* value 1..
  * obeys gln-length and gln-modulus-10

Invariant: gln-length
Description: "GLN must be exactly 13 characters long"
Severity: #error
Expression: "value.matches('^[0-9]{13}$')"

Invariant: gln-modulus-10
Description: "GLN must pass the modulus 10 check - https://www.gs1.org/services/how-calculate-check-digit-manually"
Severity: #error
Expression: "((\n(10-((value.substring(0,1).toInteger()*1)+\n(value.substring(1,1).toInteger()*3)+\n(value.substring(2,1).toInteger()*1)+\n(value.substring(3,1).toInteger()*3)+\n(value.substring(4,1).toInteger()*1)\n+(value.substring(5,1).toInteger()*3)\n+(value.substring(6,1).toInteger()*1)\n+(value.substring(7,1).toInteger()*3)\n+(value.substring(8,1).toInteger()*1)\n+(value.substring(9,1).toInteger()*3)\n+(value.substring(10,1).toInteger()*1)\n+(value.substring(11,1).toInteger()*3))mod(10))mod(10))=value.substring(12,1).toInteger())"