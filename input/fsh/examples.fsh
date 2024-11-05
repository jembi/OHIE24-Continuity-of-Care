Instance: CurrentServiceProviderExample1
InstanceOf: ServiceProvider
Usage: #example
Title: "Organization - Facility A"
Description: "An organization providing health related services."
* identifier[HIN].value = "facilityA"
* identifier[HIN].system = $HIN
* active = true
* name = "Facility A"
* address[+].line[+] = "Meshulekia"
* address[=].city = "Kirkos"
* address[=].state = "Addis Ababa"
* address[=].district = "Kirkos woreda 9"

Instance: CurrentServiceProviderExample2
InstanceOf: ServiceProvider
Usage: #example
Title: "Organization - Facility B"
Description: "An organization providing health related services."
* identifier[HIN].value = "facilityB"
* identifier[HIN].system = $HIN
* active = true
* name = "Facility B"
* address[+].line[+] = "Piassa"
* address[=].city = "Dessie"
* address[=].state = "Addis Ababa"
* address[=].district = "Arada"

Instance: GeneralPractitionerExample
InstanceOf: GeneralPractitioner
Usage: #example
Title: "Practitioner - General Practitioner"
Description: 
"Represents the practitioners who participated in the observation."
* name[+].given[+] = "Tom"
* name[=].given[+] = "Junes"
* name[=].family = "Smith"
* telecom[+].system = #phone
* telecom[=].value = "27537652509"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "someone@something.org"
* telecom[=].use = #home

Instance: GeneralEncounterExample
InstanceOf: TargetFacilityEncounter
Usage: #example
Title: "Encounter - Facility A"
Description: "Represents the current facility at which the patient is receiving health services."
* class = $ActCodeV3CodeSystem#AMB
* status = #finished
* subject = Reference(PatientExample1)
* period.start = "2012-12-09"
* period.end = "2012-12-09"
* serviceProvider = Reference(CurrentServiceProviderExample1)