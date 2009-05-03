package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientVisitEvent extends Event 
	{
		
		public static const PATIENT_VISIT_CREATE:String = "patientVisitCreate";
		public static const PATIENT_VISIT_UPDATE:String = "patientVisitUpdate";
    
        public var patientVisit:XML;
    
        public function PatientVisitEvent(type:String, patientVisit:XML) {
            super(type,true);
            this.patientVisit = patientVisit;
        }
	}
	
}