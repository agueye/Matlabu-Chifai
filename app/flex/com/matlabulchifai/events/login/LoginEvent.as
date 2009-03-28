package com.matlabulchifai.events.login
{
	import flash.events.Event;

	public class LoginEvent extends Event
	{
		public static const LOGIN:String = "login";
		public var user:XML;
		
		public function LoginEvent(user:XML)
		{
			//super(type, bubbles, cancelable);
			super(LOGIN, true);
			this.user = user;
		}
		
	}
}