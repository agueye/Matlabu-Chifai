package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientPrescriptionEvent extends Event 
	{
		
		public static const PATIENT_PRESCRIPTION_CREATE:String = "patientPrescriptionCreate";
    
        public var patientPrescription:XML;
    
        public function PatientPrescriptionEvent(type:String, patientPrescription:XML) {
            super(type);
            this.patientPrescription = patientPrescription;
        }
	}
	
}