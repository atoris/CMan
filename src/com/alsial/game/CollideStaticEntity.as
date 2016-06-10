package com.alsial.game 
{
	import com.alsial.game.entitys.Ground;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class CollideStaticEntity 
	{
		private var _arrEntity:Array;
		private var _left:Boolean;
		private var _right:Boolean;
		private var _down:Boolean;
		private var _up:Boolean;
		private var _upLeft:Boolean;
		private var _upRight:Boolean;
		private var _downLeft:Boolean;
		private var _downRight:Boolean;
		
		private var _xPos:int;
		private var _yPos:int;
		
		public function CollideStaticEntity() 
		{
			_arrEntity = new Array();
		}
		
		public function getLeftEntity(ent:Entity,  dist:int=1):String 
		{
			
			var str:String = "NULL";
			_left = false;	
			for (var i:int = 0; i < _arrEntity.length; i++) 
			{
				if (ent.collide(_arrEntity[i], ent.x - dist, ent.y)) 
				{
					str = _arrEntity[i];
					_left = true;
				}
			}
			
			return str;
		}
		public function getRightEntity(ent:Entity, dist:int=1):String 
		{
			
			var str:String = "NULL";
			_right = false;	
			for (var i:int = 0; i < _arrEntity.length; i++) 
			{
				if (ent.collide(_arrEntity[i], ent.x + dist, ent.y)) {
					str = _arrEntity[i];
					_right = true;	
				}				
			}
			return str;
		}
		public function getUpEntity(ent:Entity, dist:int=1):String 
		{
			var str:String = "NULL";
			_up = false;	
			for (var i:int = 0; i < _arrEntity.length; i++) 
			{
				if (ent.collide(_arrEntity[i], ent.x, ent.y - dist)) {
					str = _arrEntity[i];
					_up = true;	
				}		
			}
			return str;
		}
		public function getDownEntity(ent:Entity, dist:int=1):String 
		{
			var str:String = "NULL";
			_down = false;	
			for (var i:int = 0; i < _arrEntity.length; i++) 
			{
				if (ent.collide(_arrEntity[i], ent.x , ent.y + dist)) {
					str = _arrEntity[i];
					_down = true;	
				}					
			}
			return str;
		}
		public function getUpLeftEntity(ent:Entity,  distX:int=1,distY:int=1):String 
		{
			var arr:Array = MyWorld.arrLevel;
			var str:String = "NULL";
			for (var i:int = 0; i < Opt.ARR_OBJECT_ID.length; i++) 
			{
				
				if (arr[int(ent.y / 32) - 1][int(ent.x / 32) - 1] == Opt.ARR_OBJECT_ID[i]){
					str = Opt.ARR_OBJECT_NAME[i];
					break;
				}
			}
			
			return str;
		}
		public function getUpRightEntity(ent:Entity,arr:Array=null):String 
		{
			
			var arr:Array = MyWorld.arrLevel;
			var str:String = "NULL";
			if (arr!=null) 
			{
				for (var i:int = 0; i < Opt.ARR_OBJECT_ID.length; i++) 
				{
					
					if (arr[int(ent.y / 32) - 1][int(ent.x / 32) + 1] == Opt.ARR_OBJECT_ID[i]){
						str = Opt.ARR_OBJECT_NAME[i];
						break;
					}
				}
			
			}else{
				for (var i:int = 0; i < arr.length; i++) 
				{
					
					if (arr[int(ent.y / 32) - 1][int(ent.x / 32) + 1] == Opt.ARR_OBJECT_ID[i]){
						str = Opt.ARR_OBJECT_NAME[i];
						break;
					}
				}
			}
			
			return str;
		}
		public function getDownLeftEntity(ent:Entity,  distX:int=1,distY:int=1):String 
		{
			
			var arr:Array = MyWorld.arrLevel;
			var str:String = "NULL";
			for (var i:int = 0; i < Opt.ARR_OBJECT_ID.length; i++) 
			{
				
				if (arr[int(ent.y / 32) + 1][int(ent.x / 32) - 1] == Opt.ARR_OBJECT_ID[i]){
					str = Opt.ARR_OBJECT_NAME[i];
					break;
				}
			}
			
			return str;
		}
		public function getDownRightEntity(ent:Entity,   distX:int=1,distY:int=1):String 
		{
			
			var arr:Array = MyWorld.arrLevel;
			var str:String = "NULL";
			for (var i:int = 0; i < Opt.ARR_OBJECT_ID.length; i++) 
			{
				
				if (arr[int(ent.y / 32) + 1][int(ent.x / 32) + 1] == Opt.ARR_OBJECT_ID[i]){
					str = Opt.ARR_OBJECT_NAME[i];
					break;
				}
			}
			
			return str;
		}
		
		public function get arrEntity():Array { return _arrEntity; }			
		public function set arrEntity(value:Array):void { _arrEntity = value; }		
		
		public function get left():Boolean { return _left; }			
		public function set left(value:Boolean):void { _left = value; }
		
		public function get right():Boolean { return _right; }		
		public function set right(value:Boolean):void { _right = value; }		
		
		public function get down():Boolean { return _down; }		
		public function set down(value:Boolean):void { _down = value; }		
		
		public function get up():Boolean { return _up; }			
		public function set up(value:Boolean):void { _up = value; }
			
		public function get upLeft():Boolean { return _upLeft; }			
		public function set upLeft(value:Boolean):void { _upLeft = value; }		
		
		public function get upRight():Boolean {	return _upRight; }		
		public function set upRight(value:Boolean):void { _upRight = value; }		
		
		public function get downLeft():Boolean { return _downLeft; }		
		public function set downLeft(value:Boolean):void { _downLeft = value; }
		
		public function get downRight():Boolean { return _downRight; }		
		public function set downRight(value:Boolean):void { _downRight = value; }
		
	}

}