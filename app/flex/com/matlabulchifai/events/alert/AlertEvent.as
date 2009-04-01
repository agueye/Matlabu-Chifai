package com.matlabulchifai.events.alert
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class AlertEvent extends Event 
	{
		
		public static const ALERT_CREATE:String = "alertCreate";
    
        public var alert:XML;
    
        public function AlertEvent(type:String, alert:XML) {
            super(type);
            this.alert = alert;
        }
		
	}
	
}