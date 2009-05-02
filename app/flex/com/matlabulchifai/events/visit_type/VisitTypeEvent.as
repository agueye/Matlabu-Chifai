package com.matlabulchifai.events.visit_type
{
	import flash.events.Event;

	public class VisitTypeEvent extends Event 
	{
		
		public static const VISIT_TYPE_CREATE:String = "visitTypeCreate";
		public static const VISIT_TYPE_UPDATE:String = "visitTypeUpdate";
    
        public var visit_type:XML;
    
        public function VisitTypeEvent(type:String, visit_type:XML) {
            super(type, true);
            this.visit_type = visit_type;
        }
	}
	
}