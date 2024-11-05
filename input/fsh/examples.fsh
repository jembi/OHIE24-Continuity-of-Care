Instance: CurrentServiceProviderExample1
InstanceOf: ServiceProvider
Usage: #example
Title: "Organization - Facility A"
Description: "An organization providing health related services."
* identifier[HIN].value = "facilityA"
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

Instance: ProvidersLocationExample
InstanceOf: ProvidersLocation
Usage: #example
Title: "Providers Location"
Description: "Represents the physical location of the provider."
* identifier[LocationID][+].value = "Location-ID-1"

* name = "Location name"
* status = #active

* address[+].country = urn:iso:std:iso:3166#LK
* address[=].type = #postal
* address[=].district = "Ampara"
* address[=].line[+] = "177"
* address[=].line[+] = "Nawala Road"
* address[=].city = "Nugegoda"
* address[=].postalCode = "32350"
* address[=].state = "Colombo"

* managingOrganization = Reference(CurrentServiceProviderExample1)

Instance: PatientExample1
InstanceOf: HIVPatient
Usage: #example
Title: "Patient - Example 1"
Description: "Is used to document demographics and other administrative information about an HIMS or HHIMS individual receiving care or other health-related services."
* identifier[PPN][+].value = "Passport-1"
* identifier[Drivers][+].value = "Drivers license-1"
* identifier[Drivers][+].value = "Drivers license-2"
* identifier[NIC][+].value = "National identity number-1"
* identifier[SCN][+].value = "Senior citizen number-1"
* identifier[PHN][+].value = "personal health number"

* name[+].given[+] = "Mike"
* name[=].given[+] = "John"
* name[=].family = "Smith"

* gender = #male
* birthDate = "1983-05-22"

* address[+].country = urn:iso:std:iso:3166#LK
* address[=].type = #postal
* address[=].district = "Ampara"
* address[=].line[+] = "177"
* address[=].line[+] = "Nawala Road"
* address[=].city = "Nugegoda"
* address[=].postalCode = "32350"
* address[=].state = "Colombo"

* telecom[+].system = #phone
* telecom[=].value = "+27829999999"
* telecom[+].system = #email
* telecom[=].value = "someone@something.com"
* telecom[+].system = #email
* telecom[=].value = "someone2@something.com"

Instance: ViralLoadResultExample1
InstanceOf: ViralLoadResultObservation
Usage: #example
Title: "Observation - Viral Load Result"
Description: "Represents the patient's viral load result."
* status = #final
* code = $SCT#315124004
* subject = Reference(PatientExample1)
* encounter = Reference(GeneralEncounterExample)
* effectiveDateTime = "2023-12-11"
* performer = Reference(CurrentServiceProviderExample1)
* valueQuantity = $UCUM_UNIT#1/mL
* valueQuantity.value = 900
* valueQuantity.unit = "copies/mL"