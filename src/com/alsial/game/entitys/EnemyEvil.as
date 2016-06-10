
package com.alsial.game.entitys
{
	/**
	 * ...
	 * @author ...
	 */
	import flash.geom.Point;
	import net.flashpunk.Entity
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import com.alsial.game.*;
	
	
	public class EnemyEvil extends Entity
	{
		private const _ID:int = 8;
		
		
		private var _arrMove:Array = new Array();
		private var _step:StepGame;
		private var _move:String;
		private var _bool:Boolean=true;
		private var _box:Box;
		private var _pos:Point;
		
		
		private var _left:Boolean;
		private var _right:Boolean;
		private var _up:Boolean;
		private var _down:Boolean;
		
		private var _tMin:int;
		
		public function EnemyEvil(xPos:Number,yPos:Number ) 
		{
			graphic = new Image(Res.ENEMY_EVIL);
			setHitbox(32, 32);
			type = Opt.ENEMY_EVIL;
			x = xPos * 32;
			y = yPos * 32;
			_step = new StepGame();
			_step.step = 1;
			_pos = new Point();
			
			
		}
		
		override public function update():void 
		{
			super.update();
			_left = (	MyWorld.arrLevel[int(y / 32)][int(x / 32) - 1] == 0 || 
						MyWorld.arrLevel[int(y / 32)][int(x / 32) - 1] == Opt.ID_PLAYER || 
						MyWorld.arrLevel[int(y / 32)][int(x / 32) - 1] == 4);				
			_right = (	MyWorld.arrLevel[int(y / 32)][int(x / 32) + 1] == 0 ||
						MyWorld.arrLevel[int(y / 32)][int(x / 32) + 1] == Opt.ID_PLAYER || 
						MyWorld.arrLevel[int(y / 32)][int(x / 32) + 1] == 4);
										
			_down = (	MyWorld.arrLevel[int(y / 32) + 1][int(x / 32)] == 0 ||
						MyWorld.arrLevel[int(y / 32) + 1][int(x / 32)] == Opt.ID_PLAYER ||
						MyWorld.arrLevel[int(y / 32) + 1][int(x / 32)] == 4);				
			_up = (		MyWorld.arrLevel[int(y / 32) - 1][int(x / 32)] == 0 || 
						MyWorld.arrLevel[int(y / 32) - 1][int(x / 32)] == Opt.ID_PLAYER ||
						MyWorld.arrLevel[int(y / 32) - 1][int(x / 32)] == 4);
			testCollide();
			randomMove();
			
			var pl:Player = (collide(Opt.PLAYER, x, y)) as Player;
			if (pl) 
			{
				FP.world.remove(pl);
			}
			
			
		}
		
		private function hBox():int 
		{
			for (var i:int = 0; i < 32; i++) 
			{
				return i;
			}
			return 0;
		}
		public function destroy():void 
		{
			Opt.score+= 5;
			FP.world.remove(this);
		}
		private function randomMove():void 
		{
			
			
			if (!_bool) 
			{
				//trace(_ranNum=int(Math.random()*_ranNumMax));
				
				if (_move=="left") 
				{
					if (_step.move()) 
					{
						x -= Opt.SPEED/4;
						_bool = false;
						//trace("xxx");
					}else {	
						//_mLeft = false;
						if (!_left) 
						{
							_bool = true;
						}
							
						
						ChangeArrLevel.setLeft(y / 32, x / 32, _ID);
						_step.reMove();
					}
				}
				if (_move=="right") 
				{
					if (_step.move()) 
					{
						x += Opt.SPEED/4;
						_bool = false;
					}else {	
						//_mLeft = false;
						
							
						if (!_right) 
						{
							_bool = true;
						}
						ChangeArrLevel.setRight(y / 32, x / 32, _ID);
						_step.reMove();
					}
				}
				if (_move=="down") 
				{
					if (_step.move()) 
					{
						y += Opt.SPEED/4;
						_bool = false;
					}else {	
						
						if (!_down) 
						{
							_bool = true;
						}
						
						ChangeArrLevel.setDown(y / 32, x / 32, _ID);
						_step.reMove();
					}
				}
				if (_move=="up") 
				{
					if (_step.move()) 
					{
						y -= Opt.SPEED/4;
						_bool = false;
					}else {	
						
						if (!_up) 
						{
							_bool = true;
						}
						ChangeArrLevel.setUp(y / 32, x / 32, _ID);
						_step.reMove();
					}
				}
			}
			
			//trace(!collide(Opt.BOX,x,y-hBox()));
			
		}
		
		private function testCollide():void 
		{
			//left
			
			
			//_move = "left";
			//_bool = false;
			
			if (_bool) 
			{
				
				_arrMove = new Array();
				
				for (var i:int = 0; i < _arrMove.length; i++) 
				{
					if (_arrMove[i]==true) 
					{
						_move = _arrMove[i];
					}
				}
				
				
				if (_left) 
				{
					_arrMove.push("left");
				}
				if (_right) 
				{
					_arrMove.push("right");
				}
				if (_down) 
				{
					_arrMove.push("down");
				}
				if (_up) 
				{
					_arrMove.push("up");
				}
				
				/*
				if (!collide(Opt.BOX,x-1,y) && !collide(Opt.WALL,x-1,y) && !collide(Opt.STAR,x-1,y) && !collide(Opt.GROUND,x-1,y) && !collide(Opt.STONE,x-1,y)) 
				{
					_arrMove.push("left");
				}
				if (!collide(Opt.BOX,x-1,y) && !collide(Opt.WALL,x+1,y) && !collide(Opt.STAR,x+1,y) && !collide(Opt.GROUND,x+1,y) ) 
				{
					_arrMove.push("right");
				}
				if (!collide(Opt.BOX,x,y+1) && !collide(Opt.WALL,x,y+1) && !collide(Opt.STAR,x,y+1) && !collide(Opt.GROUND,x,y+1) ) 
				{
					_arrMove.push("down");
				}
				if (!collide(Opt.WALL,x,y-1) && !collide(Opt.STAR,x,y-1) && !collide(Opt.GROUND,x,y-1)) 
				{
					_arrMove.push("up");
				}*/
				_move = _arrMove[int(Math.random() * _arrMove.length)];
				
				_bool = false;
				//trace(lPos(Opt.WALL));
			}else if (_move==null) 
			{
				_bool = true;
			}
			//trace(_arrMove,_left,_right,_up,_down,_move,_bool);
		}
		
		
	}

}