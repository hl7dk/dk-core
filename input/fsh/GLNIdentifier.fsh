Profile: GLNIdentifier
Parent: Identifier
Id: dk-core-gln-identifier
Title: "GLN Identifier"
Description: "Identifier holding a 13 digit GLN"
* use = #official (exactly)
* system 1..
* system = "" (exactly)
* value 1..
  * obeys gln-length and gln-modulus-10

Invariant: gln-length
Description: "GLN must be exactly 13 characters long"
Severity: #error
Expression: "matches('^[0-9]{13}$')"

Invariant: gln-modulus-10
Description: "GLN must pass the modulus 10 check - https://www.gs1.org/services/how-calculate-check-digit-manually"
Severity: #error
Expression: "((\n(10-((substring(0,1).toInteger()*1)+\n(substring(1,1).toInteger()*3)+\n(substring(2,1).toInteger()*1)+\n(substring(3,1).toInteger()*3)+\n(substring(4,1).toInteger()*1)\n+(substring(5,1).toInteger()*3)\n+(substring(6,1).toInteger()*1)\n+(substring(7,1).toInteger()*3)\n+(substring(8,1).toInteger()*1)\n+(substring(9,1).toInteger()*3)\n+(substring(10,1).toInteger()*1)\n+(substring(11,1).toInteger()*3))mod(10))mod(10))=substring(12,1).toInteger())"
