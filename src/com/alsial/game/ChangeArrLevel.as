package com.alsial.game 
{
	/**
	 * ...
	 * @author Atoris
	 */
	public class ChangeArrLevel 
	{
		private static var _arr:Array = new Array();
		public function ChangeArrLevel() 
		{
			_arr = MyWorld.arrLevel;
		}
		
		public static function setLeft(i:int, j:int,n:int):Array { 
			_arr = MyWorld.arrLevel;
			if (_arr[i][j-1]!=null) 
			{
				_arr[i][j] = n;
				_arr[i][j + 1] = 0;
			}
			MyWorld.arrLevel = _arr;
			return _arr;
		}
		public static function	setRight(i:int, j:int, n:int ):Array {
			_arr = MyWorld.arrLevel;
			//trace( i,j);
			if (_arr[i][j+1]!=null) 
			{
				//_arr[i][j + 1] = _arr[i][j];
				_arr[i][j] = n;
				_arr[i][j - 1] = 0;
			}
			MyWorld.arrLevel = _arr;
			return _arr;
		}
		public static function setDown(i:int, j:int,n:int):Array 
		{
			//trace("DOWN");
			_arr = MyWorld.arrLevel;
			if (_arr[i+1][j]!=null) 
			{
				//_arr[i+1][j] = n;
				_arr[i][j] = n;
				_arr[i-1][j] = 0;
			}
			MyWorld.arrLevel = _arr;
			return _arr;
		}
		public static function setUp(i:int, j:int,n:int):Array 
		{
			//trace("UP");
			_arr = MyWorld.arrLevel;
		
			if (_arr[i-1][j]!=null) 
			{
				//_arr[i-1][j] = n;
				_arr[i][j] =n;
				_arr[i+1][j] = 0;
			}
			MyWorld.arrLevel = _arr;
			return _arr;
		}
		
		public static function replacement(i:int, j:int,n:int):Array {
			_arr = MyWorld.arrLevel;			
			_arr[i][j] =n;				
			MyWorld.arrLevel = _arr;
			return _arr;
		}
		
		
		
		public static function log():void 
		{
			//_arr = MyWorld.arrLevel;	
			for (var i:int = 0; i < _arr.length; i++) 
			{
				trace(_arr[i]);
			}
			trace("========================================");
		}
	}

}