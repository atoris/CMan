package com.alsial.game.entitys 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.alsial.game.*;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class StaticEntity extends Entity
	{
		protected var _step:StepGame;
		//private const Opt.SPEED:int = 4;
		protected var _leftB:Boolean;
		protected var _rightB:Boolean;
		protected var _downB:Boolean;
		protected var _upB:Boolean;
		protected var _leftUpB:Boolean;
		protected var _leftDownB:Boolean;
		protected var _rightDownB:Boolean;
		protected var _rightUpB:Boolean;
		
		protected var _right:Boolean;
		
		protected var _wLeft:Boolean;
		
		
		protected var _tMin:int = 0;
		protected var _tMax:int = 32;
		protected var _gravity:Boolean;
		protected var _push:Boolean;
		public var _altitude:int = 0;
		
		protected var _xBool:Boolean;
		protected var _id:int;
		protected var _yBool:Boolean;
		
		protected var _pos:Point;
		
		protected var arr:Array;
		
		public var rightStoneB:Boolean;
		
		protected var _stoneName:String;
		protected var _img:Image;
		public var _xxx:Boolean;
		private var _doorActive:Boolean;
		protected var _bGravity:Boolean;
		public function StaticEntity(xPos:Number=0,yPos:Number=0) 
		{
			_xxx = false;
			_pos = new Point(int(y/32),int(x/32));
		}
		
		
		override public function update():void 
		{
			super.update();
			
			var door:TriggerDoor = collide(Opt.TRIGGERDOOR,x,y+1) as TriggerDoor;			
			if (door!=null) 
			{
				_doorActive = door.active;
			}	
			if (_bGravity) 
			{
				_xBool = false;			
			
				if (!collide(Opt.GROUND,x,y+1) && !collide(Opt.BOX,x,y+1) && !collide(Opt.WALL,x,y+1) && !collide(Opt.PLAYER,x,y+1) && !collide(Opt.STAR,x,y+1) && !collide(Opt.STONE,x,y+1) &&!_doorActive) 
				{
					_gravity = true;
					
					if (_tMin<_tMax && !_push) 
					{
						_tMin += Opt.SPEED / 2;
						
						_right = false;
						
					}else {
						y += Opt.SPEED;
						if (y%32==0) 
						{
							
						_xBool = true;
						ChangeArrLevel.setDown(int(y / 32), int(x / 32), _id);	
									
						
						}else {
							_xBool = false;
						}
						_altitude+= Opt.SPEED;
					}
				}else {					
					_altitude = 0;
					_tMin = 0;
					_gravity = false;
					
				}
			}
			
			
			
			
			
			if (collide(Opt.PLAYER,x,y+1) && _tMin>0) 
			{
				trace("game over");
			}
			
			
			var evl:EnemyEvil = collide(Opt.ENEMY_EVIL,x,y) as EnemyEvil;
			if (evl) 
			{
				evl.destroy();
			}
			
			arr = MyWorld.arrLevel;
			
			
			
		}
		public function moveLeft():void {
			if (_leftB)
			{
				x -= Opt.SPEED;
				_push = true;
			}else {
				
				_push = false;
			}
			if (x%32==0) 
				{
					ChangeArrLevel.setLeft(y / 32, x / 32, _id);
				}
			
		}
		public function moveRight():void 
		{
			
			if (_rightB) 
			{
				x += Opt.SPEED;
				_push = true;
			}else {				
				_push = false;
				
			}
			if (x%32==0) 
			{
				ChangeArrLevel.setRight(y / 32, x / 32, _id);
			}
			
			
		}
		
		
		
		
		public function destroy():void {
			
			FP.world.remove(this);			
			
			//trace("destroy");
		}
		
		public function addStar():void 
		{
			FP.world.add(new EnemyEvil(x / 32, y / 32));
			ChangeArrLevel.replacement(y/32,x/32,7);
		}
		
		
		
		public function get leftB():Boolean 
		{
			return _leftB;
		}
		
		public function set leftB(value:Boolean):void 
		{
			_leftB = value;
		}
		
		public function get rightB():Boolean 
		{
			return _rightB;
		}
		
		public function set rightB(value:Boolean):void 
		{
			_rightB = value;
		}
		
		public function get gravity():Boolean 
		{
			return _gravity;
		}
		
		public function set gravity(value:Boolean):void 
		{
			_gravity = value;
		}
		
		
		
	}

}