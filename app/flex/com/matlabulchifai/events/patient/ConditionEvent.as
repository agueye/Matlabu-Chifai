package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class ConditionEvent extends Event 
	{
		
		public static const CONDITION_CREATE:String = "conditionCreate";
    
        public var condition:XML;
    
        public function ConditionEvent(type:String, alert:XML) {
            super(type, true);
            this.condition = condition;
        }
	}
	
}