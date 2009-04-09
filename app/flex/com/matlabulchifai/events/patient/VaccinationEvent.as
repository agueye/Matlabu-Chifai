package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class VaccinationEvent extends Event 
	{
		
		public static const VACCINATION_CREATE:String = "vaccinationCreate";
    
        public var vaccination:XML;
    
        public function VaccinationEvent(type:String, vaccination:XML) {
            super(type);
            this.vaccination = vaccination;
        }
	}
	
}