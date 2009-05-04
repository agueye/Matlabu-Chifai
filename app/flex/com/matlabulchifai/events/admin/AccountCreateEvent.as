package com.matlabulchifai.events.admin
{
	import flash.events.Event;

	public class AccountCreateEvent extends Event
	{
		public static const ACCOUNT_CREATE:String = "accountCreate";
		
		public function AccountCreateEvent()
		{
			super(ACCOUNT_CREATE, true);
		}
		
	}
}