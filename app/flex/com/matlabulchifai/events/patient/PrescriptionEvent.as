package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PrescriptionEvent extends Event 
	{
		
		public static const PRESCRIPTION_CREATE:String = "prescriptionCreate";
    
        public var prescription:XML;
    
        public function PrescriptionEvent(type:String, prescription:XML) {
            super(type);
            this.prescription = prescription;
        }
	}
	
}