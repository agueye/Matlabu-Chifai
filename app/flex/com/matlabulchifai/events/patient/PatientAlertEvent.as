package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientAlertEvent extends Event 
	{
		
		public static const PATIENT_ALERT_CREATE:String = "patientAlertCreate";
		public static const PATIENT_ALERT_DESTROY:String = "patientAlertDestroy";
		public static const PATIENT_ALERT_UPDATE:String = "patientAlertUpdate";
    
        public var patientAlert:XML;
    
        public function PatientAlertEvent(type:String, patientAlert:XML) {
            super(type, true);
            this.patientAlert = patientAlert;
        }
	}
	
}