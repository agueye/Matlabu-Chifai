package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class AlertEvent extends Event 
	{
		
		public static const ALERT_CREATE:String = "alertCreate";
    
        public var alert:XML;
    
        public function AlertEvent(type:String, alert:XML) {
            super(type, true);
            this.alert = alert;
        }
	}
	
}