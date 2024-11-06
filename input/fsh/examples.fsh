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
* subject = Reference(PatientExample1)
* encounter = Reference(GeneralEncounterExample)
* effectiveDateTime = "2023-12-11"
* performer = Reference(CurrentServiceProviderExample1)
* valueQuantity.value = 900

Instance: RoutineViralLoadServiceRequestExample
InstanceOf: ViralLoadServiceRequest
Usage: #example
Title: "Service Request - Routine Viral Load"
Description: "Represents the service request for a routine viral load."
* status = #completed
* intent = #order
* subject = Reference(PatientExample1)
* encounter = Reference(GeneralEncounterExample)
* requester = Reference(CurrentServiceProviderExample1)
* performer = Reference(CurrentServiceProviderExample2)
* authoredOn = "2024-01-25"
* priority = #routine

Instance: RoutineViralLoadDiagnosticReportExample
InstanceOf: ViralLoadDiagnosticReport
Usage: #example
Title: "Diagnostic Report - Routine Viral Load"
Description: "Represents the results for a routine viral load as unsuppressed."
* status = #final
* subject = Reference(PatientExample1)
* encounter = Reference(GeneralEncounterExample)
* result = Reference(ViralLoadResultExample1)
* effectiveDateTime = "2024-01-25"
* issued = "2024-01-25T11:45:33+11:00"
* basedOn = Reference(RoutineViralLoadServiceRequestExample)
* performer = Reference(CurrentServiceProviderExample1)

Instance: HIVStatusConsentPermitted1
InstanceOf: HIVStatusConsent
Usage: #example
Title: "Consent - Patient Permitted Sharing PHI With Any Facility"
Description: "Represents the patient's consent to share and have their PHI further managed by any facility."
* status = #active
* scope = $ConsentScopeCodeSystem#patient-privacy
* category = $LNC#59284-0
* patient = Reference(PatientExample1)
* dateTime = "2024-01-25"
* organization = Reference(CurrentServiceProviderExample1)
* sourceAttachment.title = "The terms of the consent in lawyer speak."
* policyRule = $ActCodeV3CodeSystem#OPTIN

Instance: HIVStatusConsentPermitted2
InstanceOf: HIVStatusConsent
Usage: #example
Title: "Consent - Patient Permitted Sharing HIV Information With Any Facility - On a Timeline"
Description: "Represents the patient's consent to share and have their PHI (HIV data) further managed by any facility."
* status = #active
* scope = $ConsentScopeCodeSystem#patient-privacy
* category = $LNC#59284-0
* patient = Reference(PatientExample1)
* dateTime = "2024-01-25"
* organization = Reference(CurrentServiceProviderExample1)
* sourceAttachment.title = "The terms of the consent in lawyer speak."
* policyRule = $ActCodeV3CodeSystem#OPTIN
* provision
  * period
    * start = "2024-01-25"
    * end = "2024-05-25"
  * data[+]
    * meaning = #dependents
    * reference = Reference(ViralLoadServiceRequest)

Instance: HIVStatusConsentDenied1
InstanceOf: HIVStatusConsent
Usage: #example
Title: "Consent - Patient Consents to Sharing HIV Information Except With Facility B"
Description: "Represents the patient's consent to NOT have their HIV status disclosed and further managed by organization \"Facility B\"."
* status = #active
* scope = $ConsentScopeCodeSystem#patient-privacy
* category = $LNC#59284-0
* patient = Reference(PatientExample1)
* dateTime = "2024-01-25"
* organization = Reference(CurrentServiceProviderExample1)
* sourceAttachment.title = "The terms of the consent in lawyer speak."
* policyRule = $ActCodeV3CodeSystem#OPTIN
* provision
  * type = #deny
  * actor[+]
    * role = $ParticipationTypeV3CodeSystem#PRCP
    * reference = Reference(CurrentServiceProviderExample2)
  * action[+] = $ConsentActionCodeSystem#access
  * action[+] = $ConsentActionCodeSystem#correct
  * data[+]
    * meaning = #dependents
    * reference = Reference(ViralLoadServiceRequest)

Instance: HIVStatusConsentDenied2
InstanceOf: HIVStatusConsent
Usage: #example
Title: "Consent - Patient Does Not Consent to Sharing HIV Information Outside of Facility A Except With Facility B - Read Only Access"
Description: "Represents the patient's consent to NOT share and have their PHI (HIV data) further accessed by any organization other than \"Facility A\" (Custodian) and \"Facility B\" (Secondary Use)."
* status = #active
* scope = $ConsentScopeCodeSystem#patient-privacy
* category = $ActCodeV3CodeSystem#INFAO
* patient = Reference(PatientExample1)
* dateTime = "2024-01-25"
* organization = Reference(CurrentServiceProviderExample1)
* sourceAttachment.title = "The terms of the consent in lawyer speak."
* policyRule = $ActCodeV3CodeSystem#OPTOUT
* provision
  * type = #permit
  * actor[+]
    * role = $ParticipationTypeV3CodeSystem#CST
    * reference = Reference(CurrentServiceProviderExample1)
  * actor[+]
    * role = $ParticipationTypeV3CodeSystem#PRCP
    * reference = Reference(CurrentServiceProviderExample2)
  * action[+] = $ConsentActionCodeSystem#access
  * data[+]
    * meaning = #dependents
    * reference = Reference(ViralLoadServiceRequest)