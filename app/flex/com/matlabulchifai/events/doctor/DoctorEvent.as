package com.matlabulchifai.events.doctor
{
	import flash.events.Event;

	public class DoctorEvent extends Event 
	{
		
		public static const DOCTOR_CREATE:String = "doctorCreate";
		public static const DOCTOR_UPDATE:String = "doctorUpdate";
    
        public var doctor:XML;
    
        public function DoctorEvent(type:String, alert:XML) {
            super(type, true);
            this.doctor = doctor;
        }
	}
	
}// ActionScript file
