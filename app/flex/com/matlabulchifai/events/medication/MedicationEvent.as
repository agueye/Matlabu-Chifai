package com.matlabulchifai.events.medication
{
	import flash.events.Event;

	public class MedicationEvent extends Event 
	{
		
		public static const MEDICATION_CREATE:String = "medicationCreate";
		public static const MEDICATION_UPDATE:String = "medicationUpdate";
    
        public var medication:XML;
    
        public function MedicationEvent(type:String, medication:XML) {
            super(type, true);
            this.medication = medication;
        }
	}
	
}