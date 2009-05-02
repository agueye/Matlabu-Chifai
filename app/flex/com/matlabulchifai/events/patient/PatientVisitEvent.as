package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class PatientVisitEvent extends Event 
	{
		
		public static const VISIT_CREATE:String = "visitCreate";
    
        public var visit:XML;
    
        public function PatientVisitEvent(type:String, visit:XML) {
            super(type);
            this.visit = visit;
        }
	}
	
}