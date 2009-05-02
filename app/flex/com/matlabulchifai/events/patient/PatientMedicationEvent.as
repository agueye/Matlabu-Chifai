package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientMedicationEvent extends Event 
	{
		
		public static const PATIENT_MEDICATION_CREATE:String = "patientMedicationCreate";
		public static const PATIENT_MEDICATION_UPDATE:String = "patientMedicationUpdate";
    
        public var patientMedication:XML;
    
        public function PatientMedicationEvent(type:String, patientMedication:XML) {
            super(type, true);
            this.patientMedication = patientMedication;
        }
	}
	
}