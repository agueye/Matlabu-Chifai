package com.matlabulchifai.events.condition
{
	import flash.events.Event;

	public class ConditionEvent extends Event 
	{
		
		public static const CONDITION_CREATE:String = "conditionCreate";
		public static const CONDITION_UPDATE:String = "conditionUpdate";
    
        public var condition:XML;
    
        public function ConditionEvent(type:String, alert:XML) {
            super(type, true);
            this.condition = condition;
        }
	}
	
}