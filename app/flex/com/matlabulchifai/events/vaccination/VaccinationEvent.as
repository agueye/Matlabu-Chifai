package com.matlabulchifai.events.vaccination
{
	import flash.events.Event;

	public class VaccinationEvent extends Event 
	{
		
		public static const VACCINATION_CREATE:String = "vaccinationCreate";
		public static const VACCINATION_UPDATE:String = "vaccinationUpdate";
    
        public var vaccination:XML;
    
        public function VaccinationEvent(type:String, vaccination:XML) {
            super(type, true);
            this.vaccination = vaccination;
        }
	}
	
}