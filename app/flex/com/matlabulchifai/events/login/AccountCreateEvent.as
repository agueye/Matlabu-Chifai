package com.matlabulchifai.events.login
{
	import flash.events.Event;

	public class AccountCreateEvent extends Event
	{
		public static const ACCOUNT_CREATE:String = "accountCreate";
		public var user:XML;
		
		public function AccountCreateEvent(user:XML)
		{
			super(ACCOUNT_CREATE, true);
			this.user = user;
		}
		
	}
}