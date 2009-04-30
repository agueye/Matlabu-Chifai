package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientVaccinationEvent extends Event 
	{
		
		public static const PATIENT_VACCINATION_CREATE:String = "patientVaccinationCreate";
    
        public var patientVaccination:XML;
    
        public function PatientVaccinationEvent(type:String, patientVaccination:XML) {
            super(type);
            this.patientVaccination = patientVaccination;
        }
	}
	
}