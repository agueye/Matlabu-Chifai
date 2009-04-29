package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class VisitTypeEvent extends Event 
	{
		
		public static const VISIT_TYPE_CREATE:String = "visitTypeCreate";
    
        public var visit_type:XML;
    
        public function VisitTypeEvent(type:String, visit:XML) {
            super(type);
            this.visit_type = visit_type;
        }
	}
	
}