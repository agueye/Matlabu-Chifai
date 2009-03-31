package com.matlabulchifai.events.patient
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class PatientEvent extends Event 
	{
		
		public static const PATIENT_CREATE:String = "patientCreate";
    
        public var task:XML;
    
        public function PatientEvent(type:String, task:XML) {
            super(type);
            this.task = task;
        }
		
	}
	
}