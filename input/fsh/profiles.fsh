Profile: ServiceProvider
Parent: OrganizationUvIps
Id: organization
Title: "Organization"
Description: "Organization providing health related services."
* identifier 1..*

* insert Slice(identifier, reasons why this should be supported, value, system, open, Slicing the identifier based on the system value, false)

* identifier contains
    HIN 1..1

* identifier[HIN]
  * value 1..1
  * system 1..1
  * system = $HIN

* active 1..1

Profile: GeneralPractitioner
Parent: PractitionerUvIps
Id: practitioner
Title: "Practitioner"
Description: "Represents a practitioner who played a role in service delivery."
* name
  * given 1..*
  * family 1..1
* telecom 1..*

Profile: TargetFacilityEncounter
Parent: Encounter
Id: target-facility-encounter
Title: "Encounter" 
Description: "Represents the current facility at which the patient is receiving health services."
* subject 1..1
* subject only Reference(HIVPatient)
* period 1..1
* serviceProvider only Reference(ServiceProvider)

Profile: ProvidersLocation
Parent: Location
Id: providers-location
Title: "Providers Location"
Description: "Represents the physical location of the provider."
* identifier 0..*

* insert Slice(identifier, reasons why this should be supported, value, system, open, Slicing the identifier based on the system value, false)

* identifier contains
    LocationID 0..* MS

* identifier[LocationID] ^definition =
    "reason(s) why this should be supported."
* identifier[LocationID]
  * value 1..1
  * system 1..1
  * system = $ProviderLocation

* name 1..1
* status 1..1
* telecom 0..* MS
  * ^definition =
    "reason(s) why this should be supported."
* address 0..1 MS
  * ^definition =
    "reason(s) why this should be supported."
* managingOrganization 1..1
* managingOrganization only Reference(ServiceProvider)

Profile: HIVPatient
Parent: PatientUvIps
Id: hiv-patient
Title: "Patient"
Description: "Is used to document demographics and other administrative information about an HIMS or HHIMS individual receiving care or other health-related services."
* identifier 1..*

* insert Slice(identifier, reasons why this should be supported, value, system, open, Slicing the identifier based on the system value, false)

* identifier contains
    NIC 0..* MS and
    PHN 1..1 and
    PPN 1..* and
    Drivers 0..* MS and
    SCN 0..* MS

* identifier[PPN]
  * value 1..1
  * system 1..1
  * system = $Passport

* identifier[Drivers] 
  * ^definition =
    "reason(s) why this should be supported."
  * value 1..1
  * system 1..1
  * system = $Drivers

* identifier[SCN] 
  * ^definition =
    "reason(s) why this should be supported."
  * value 1..1
  * system 1..1
  * system = $SCN

* identifier[NIC]
  * ^definition =
    "reason(s) why this should be supported."
  * value 1..1
  * system 1..1
  * system = $NIC

* identifier[PHN]
  * value 1..1
  * system 1..1
  * system = $PHN

* name 1..*
  * given 1..*
  * family 1..1

* gender 1..1
* birthDate 1..1
* address 0..* MS
* address 
  * ^definition =
    "reason(s) why this should be supported."
  * city 1..1
  * line 1..*
  * district 1..1
  * state 1..1
  * country 1..1
* telecom 0..* MS
  * ^definition =
    "reason(s) why this should be supported."

Profile: HIVStatusConsent
Parent: Consent
Id: hiv-status-consent
Title: "Consent - HIV Status"
Description: "Represents the patient's consent to have their HIV status disclosed."
* ^experimental = true
* ^status = #draft
* patient 1..1
* patient only Reference(HIVPatient)
* dateTime 1..1
* category 1..1
* organization 1..1
* organization only Reference(ServiceProvider)
* sourceAttachment 1..1
* policyRule 1..1
* provision 0..1 MS
  * ^definition = "reason(s) why this should be supported."
  * type 0..1 MS
    * ^definition = "reason(s) why this should be supported."
  * actor 0..* MS
    * ^definition = "reason(s) why this should be supported."
  * action 0..* MS
    * ^definition = "reason(s) why this should be supported."
  * data 1..*
  * period 0..1 MS
    * ^definition = "reason(s) why this should be supported."

Profile: ViralLoadResultObservation
Parent: ObservationResultsLaboratoryUvIps
Id: viral-load-count-observation
Title: "Observation - Viral Load Result"
Description: "Represents the patient's Viral Load Result."
* code = $SCT#315124004
* effectiveDateTime 1..1
* valueQuantity 1..1
* valueQuantity = $UCUM_UNIT#1/mL
* valueQuantity.unit 1..1
* valueQuantity.unit = "copies/mL"
* subject 1..1
* subject only Reference(HIVPatient)
* encounter 1..1
* encounter only Reference(TargetFacilityEncounter)

Profile: ViralLoadServiceRequest
Parent: ServiceRequest
Id: vl-service-request
Title: "Service Request - PCR HIV Test"
Description: "Represents the service request for PCR HIV testing."
* code 1..1
* code = $LNC#9836-8
* category 1..1
* category = $LNC#LP94892-4

* subject 1..1
* subject only Reference(HIVPatient)

* encounter 1..1
* encounter only Reference(TargetFacilityEncounter)

* requester 1..1
* requester only Reference(ServiceProvider or GeneralPractitioner)

* performer 1..1
* performer only Reference(ServiceProvider or GeneralPractitioner)

* authoredOn 1..1

* priority 1..1

Profile: ViralLoadDiagnosticReport
Parent: DiagnosticReportUvIps
Id: viral-load-diagnostic-report
Title: "Diagnostic Report - Viral Load"
Description: "Represents the results for viral load."
* category = $LNC#11502-2
* code = $LNC#25836-8 //$SCT#315124004
* result[observation-results] 1..1
* result[observation-results] only Reference(ViralLoadResultObservation)
* basedOn 1..1
* basedOn only Reference(ViralLoadServiceRequest)
* subject 1..1
* subject only Reference(HIVPatient)
* encounter 1..1
* encounter only Reference(TargetFacilityEncounter)
* performer 1..1
* performer only Reference(ServiceProvider or GeneralPractitioner)