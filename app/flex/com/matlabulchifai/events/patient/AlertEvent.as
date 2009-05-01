package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class AlertEvent extends Event 
	{
		
		public static const ALERT_CREATE:String = "alertCreate";
		public static const ALERT_DESTROY:String = "alertDestroy";
		public static const ALERT_UPDATE:String = "alertUpdate";
    
        public var alert:XML;
    
        public function AlertEvent(type:String, alert:XML) {
            super(type, true);
            this.alert = alert;
        }
	}
	
}