package com.hillelcoren.utils
{
	import com.hillelcoren.components.AutoComplete;
	
	import mx.utils.StringUtil;
	
	public class StringUtils
	{
		/**
		 * Check if the string begins with the searchStr
		 */
		public static function beginsWith( string:String, searchStr:String):Boolean
		{
			if (!string)
			{
				return false;
			}
			
			string  = string.toLowerCase();
			searchStr = searchStr.toLowerCase();
			
			return searchStr == string.substr( 0, searchStr.length );
		}
		
		public static function contains( string:String, searchStr:String ):Boolean
		{
			var regExp:RegExp = new RegExp( searchStr, "i" );
			
			return regExp.test( string );			
		}
		
		public static function anyWordBeginsWith( string:String, searchStr:String ):Boolean
		{
			if (!string)
			{
				return false;
			}
			
			if (beginsWith( string, searchStr ))
			{
				return true;
			}
			
			// check to see if one of the words in the string is a match
			var words:Array = string.split( " " );
			
			for each (var word:String in words)
			{
				if (beginsWith( word, searchStr ))
				{
					return true;
				}
			}
			
			return false;
		}
				
		public static function capitalize( string:String ):String
		{
			return string.charAt(0).toUpperCase() + string.substring( 1, string.length );
		}
		
		public static function capitalizeWords( string:String ):String
		{
			var origWords:Array = string.split( " " );
			var newWords:Array = [];
			
			for each (var word:String in origWords)
			{
				newWords.push( StringUtils.capitalize( word ) ); 
			}

			return newWords.join( " " ); 
		}
						
		public static function unCapitalize( string:String ):String
		{
			return string.charAt(0).toLowerCase() + string.substring( 1, string.length );
		}
		
		
		/**
		 * This will convert a string to const upper case (ie, ringGroup becomes RING_GROUP)
		 */
		public static function toConstUpperCase( string:String ):String
		{
			var newString:String = "";
			
			for (var x:uint = 0; x < string.length; x++)
			{
				var char:String = string.charAt( x );
				
				// is letter upper case
				if (char.charCodeAt() <= 90 && newString.length > 0)
				{
					newString += "_";
				}
				
				newString += char;
				
			}
			
			return newString.toUpperCase();
		}
		
		public static function toCamelCaps( string:String ):String
		{
			var returnStr:String = "";
			var words:Array = string.split( "_" );
			
			for (var index:uint = 0; index < words.length; index++)
			{	
				var word:String = words[index];
				word = word.toLowerCase();
				
				if (index > 0)
				{
					word = capitalize( word );
				}
				
				returnStr += word;
			}
			
			return returnStr;		
		}
		
		public static function trimCommas( value:String ):String
		{
			value = StringUtil.trim( value );
			
			while (value.length > 0 && value.charAt( 0 ) == ",")
			{
				value = value.substring( 1, value.length );
			}
			
			while (value.length > 0 && value.charAt( value.length - 1 ) == ",")
			{
				value = value.substring( 0, value.length - 1 );
			}
			
			return value;
		}
		
		public static function highlighMatch( string:String, searchStr:String, matchType:String = "" ):String
		{
			if (!matchType)
			{
				matchType = AutoComplete.MATCH_ANY_PART;
			}
			
			var matchPos:int = string.toLowerCase().indexOf( searchStr.toLowerCase() );
			
			// if we're matching on word then we need to make sure 
			// we're highliting the right part (ie, search for "st" in "Test String" 
			// would need to higlight the "st" in String)
			if (matchType == AutoComplete.MATCH_WORD)
			{
				if (matchPos > 0 && string.charAt( matchPos - 1 ) != " ")
				{
					matchPos = string.toLowerCase().indexOf( " " + searchStr.toLowerCase() ) + 1;	
				}
			}
			
			var returnStr:String = string.substring( 0, matchPos );
			var matchedPart:String = string.substr( matchPos, searchStr.length);
			
			// there are problems using ">"s and "<"s
			matchedPart = matchedPart.replace( "<", "&lt;" ).replace( ">", "&gt;" );
			
			returnStr += "<b><u>" + matchedPart + "</u></b>";
			returnStr += string.substr( matchPos + searchStr.length, string.length ) + " ";		
			
			return returnStr;
		}
	}
}
