package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class SearchEvent extends Event 
	{
		public static const PATIENT_SEARCH:String = "patientSearch";
    
        public var searchString:String;
    
		public function SearchEvent(type:String, searchString:String) {
            super(type);
            this.searchString = searchString;
        }
	}
	
}
