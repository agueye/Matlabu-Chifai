package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientAllergyEvent extends Event 
	{
		
		public static const PATIENT_ALLERGY_CREATE:String = "patientAllergyCreate";
    
        public var patientAllergy:XML;
    
        public function PatientAllergyEvent(type:String, patientAllergy:XML) {
            super(type, true);
            this.patientAllergy = patientAllergy;
        }
	}
	
}