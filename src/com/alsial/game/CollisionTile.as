
package com.alsial.game  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Atoris
	 */
	public class CollisionTile 
	{
		private var _position:Point;
		private var _width:int=0;
		private var _height:int = 0;
		private var _id:uint;
		public function CollisionTile(pos:Point,id:uint) 
		{
			_position = pos;
			_id = id;
		}
		public function collisionTileX(id:uint):String 
		{
			
			if (MyWorld.arrLevel[_position.y][_position.x+1]==id) 
			{
				return Opt.RIGHT;
			}
			if (MyWorld.arrLevel[_position.y][_position.x-1]==id) 
			{
				return Opt.LEFT;
			}
			if (MyWorld.arrLevel[_position.y][_position.x+1]==id && MyWorld.arrLevel[_position.y][_position.x-1]==id) 
			{
				return Opt.LR;
			}
			
			return "";
		}
		public function collisionTileY(id:uint):String 
		{
			if (MyWorld.arrLevel[_position.y+1][_position.x]==id) 
			{
				return Opt.DOWN;
			}
			if (MyWorld.arrLevel[_position.y-1][_position.x]==id) 
			{
				return Opt.UP;
			}
			if (MyWorld.arrLevel[_position.y+1][_position.x]==id && MyWorld.arrLevel[_position.y-1][_position.x]==id) 
			{
				return Opt.DU;
			}
			return "";
		}
		
		public function position(p:Point):Point 
		{
			if (p.x==width) 
			{
				p.x = 0;
				MyWorld.arrLevel[_position.y][_position.x+1]=_id;
				MyWorld.arrLevel[_position.y][_position.x]=0;
				_position.x++;				
			}
			if (p.x==-width) 
			{
				p.x = 0;
				MyWorld.arrLevel[_position.y][_position.x-1]=_id;
				MyWorld.arrLevel[_position.y][_position.x]=0;
				_position.x--;
			}
			if (p.y==height) 
			{
				p.y = 0;
				MyWorld.arrLevel[_position.y+1][_position.x]=_id;
				MyWorld.arrLevel[_position.y][_position.x]=0;
				_position.y++;				
			}
			if (p.y==-height) 
			{
				p.y = 0;
				MyWorld.arrLevel[_position.y-1][_position.x]=_id;
				MyWorld.arrLevel[_position.y][_position.x]=0;
				_position.y--;
			}
			return _position;
		}
		public function setHitBox(width:int,height:int ):void 
		{
			_width = width;
			_height = height;
		}
		
		public function get height():int 
		{
			return _height;
		}
		
		public function set height(value:int):void 
		{
			_height = value;
		}
		
		public function get width():int 
		{
			return _width;
		}
		
		public function set width(value:int):void 
		{
			_width = value;
		}
		
	}

}