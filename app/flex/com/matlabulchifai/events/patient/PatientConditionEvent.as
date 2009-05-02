package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientConditionEvent extends Event 
	{
		
		public static const PATIENT_CONDITION_CREATE:String = "patientConditionCreate";
    
        public var patientCondition:XML;
    
        public function PatientConditionEvent(type:String, patientCondition:XML) {
            super(type, true);
            this.patientCondition = patientCondition;
        }
	}
	
}