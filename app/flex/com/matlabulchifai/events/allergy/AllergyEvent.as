package com.matlabulchifai.events.allergy
{
	import flash.events.Event;

	public class AllergyEvent extends Event 
	{
		
		public static const ALLERGY_CREATE:String = "allergyCreate";
		public static const ALLERGY_UPDATE:String = "allergyUpdate";
    
        public var allergy:XML;
    
        public function AllergyEvent(type:String, allergy:XML) {
            super(type, true);
            this.allergy = allergy;
        }
	}
	
}