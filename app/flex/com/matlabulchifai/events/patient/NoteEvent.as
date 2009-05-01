package com.matlabulchifai.events.patient
{
	import flash.events.Event;

	public class NoteEvent extends Event 
	{
		
		public static const NOTE_CREATE:String = "noteCreate";
		public static const NOTE_UPDATE:String = "noteUpdate";
    
        public var note:XML;
    
        public function NoteEvent(type:String, note:XML) {
            super(type);
            this.note = note;
        }
	}
	
}