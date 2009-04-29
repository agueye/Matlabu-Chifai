package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientEvent extends Event 
	{
		
		public static const PATIENT_CREATE:String = "patientCreate";
		public static const PATIENT_DESTROY:String = "patientDestroy";
		public static const PATIENT_SELECT:String = "patientSelect";
    
        public var patient:XML;
    
        public function PatientEvent(type:String, patient:XML) {
            super(type,true);
            this.patient = patient;
        }
	}
	
}