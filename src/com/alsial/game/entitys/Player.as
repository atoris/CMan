
package com.alsial.game.entitys

{
	
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import com.alsial.game.*;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Player extends Entity
	{
		
		
		private var _mLeft:Boolean;
		private var _mRight:Boolean;
		private var _mDown:Boolean;
		private var _mUp:Boolean;
		//private const Opt.SPEED:int = 4;
		
		private var _kLeft:Boolean;
		private var _kRight:Boolean;
		private var _kDown:Boolean;
		private var _kUp:Boolean;
		
		private var _step:StepGame;
		private var _boxL:Box;
		private var _boxR:Box;
		private var _stoneL:Stone;
		private var _stoneR:Stone;
		private var _changeArrLevel:ChangeArrLevel;
		private var _trigger:TriggerClass;
		
		
		public var sprSwordguy:Spritemap = new Spritemap(Res.SET, 32, 32);

		private var _coll:CollideStaticEntity;
		
		//private var _box:Box;
		public function Player(xPos:Number,yPos:Number) 
		{
			_trigger = new TriggerClass;
			sprSwordguy.add("stand", [8], 20, true);
			//sprSwordguy.add("run", [6, 7, 8, 9, 10, 11], 20, true);
			graphic = sprSwordguy;
			
			sprSwordguy.play("stand");
			//graphic = new Image(Res.PLAYER);
			setHitbox(32, 32);
			type = Opt.PLAYER;
			x = xPos * 32;
			y = yPos * 32;
			_changeArrLevel = new ChangeArrLevel();
			_step = new StepGame();
			Input.define("Left", Key.A, Key.LEFT);
			Input.define("Right", Key.D, Key.RIGHT);
			Input.define("Down", Key.S, Key.DOWN);
			Input.define("Up", Key.W, Key.UP);
			//Input.
			_coll = new CollideStaticEntity();
			//FP.camera.x = x;
			//FP.camera.y = y;
		}
		override public function update():void 
		{
			super.update();
			//FP.camera.x = x-640/2;
			//FP.camera.y = y-480/2;
			//FP.camera.x = x - FP.halfWidth;FP.camera.y = y - FP.halfHeight;
			
			/*FP.camera.x = (x - (FP.halfWidth - 16));// Follow the player
			FP.camera.y = (y - (FP.halfHeight - 16));// with the camera
						
			FP.camera.x = FP.clamp(FP.camera.x, 0, (640 - FP.width));
			FP.camera.y = FP.clamp(FP.camera.y,0, (480 - FP.height));*/
			
			
			var th:Thorns = (collide(Opt.THORNS, x, y)) as Thorns;
			
			if (th) 
			{
				th.reActive();
				if (th.boolDead) 
				{
					FP.world.remove(this);
				}
			}
			
			var triggerButton:TriggerButton = (collide(Opt.TRIGGERBUTTON, x, y)) as TriggerButton;
			//trace(triggerButton);
			if (triggerButton) 
			{
				_trigger.reActive(triggerButton);
			}
			
			movePlayer();
			
			//collidePlayer();
		}
		
		private function collidePlayer():void 
		{
			_coll.arrEntity=[Opt.BOX,Opt.DOR,Opt.ENEMY_EVIL,Opt.GROUND,Opt.STAR,Opt.STONE,Opt.THORNS,Opt.TRIGGERBUTTON,Opt.TRIGGERDOOR,Opt.WALL];
			
			
		}
		
		
		
		private function movePlayer():void 
		{
			
			_boxL = collide(Opt.BOX, x - 1, y) as Box;
			_boxR = collide(Opt.BOX, x + 1, y) as Box;
			_stoneL = collide(Opt.STONE, x - 1, y) as Stone;
			_stoneR = collide(Opt.STONE, x + 1, y) as Stone;
			inputCheck();
			stepMoveP();
			move();
			
			var gr:Ground = collide(Opt.GROUND, x, y) as Ground;
			if (gr) 
			{
				gr.destroy();
			}
			
			//trace(collideTypes(Opt.BOX, x, y));
			
		}
		
		private function move():void 
		{
			//logMove();
			if (_mLeft) 
			{
				if (_step.move()) 
				{
					x -= Opt.SPEED;
					if (_boxL) 
					{
						_boxL.moveLeft();
					}
					if (_stoneL) 
					{
						_stoneL.moveLeft();
					}
					
				}else {	
					
					_mLeft = false;
					ChangeArrLevel.setLeft(y / 32, x / 32,9);
					_step.reMove();
					
				}
			}
			if (_mRight) 
			{
				if (_step.move()) 
				{
					x += Opt.SPEED;
					if (_boxR) 
					{
						_boxR.moveRight();
					}
					if (_stoneR) 
					{
						_stoneR.moveRight();
					}
					
				}else {	
					
					_mRight = false;
					MyWorld.arrLevel = ChangeArrLevel.setRight(y / 32, x / 32,9);
					_step.reMove();
					
				}
			}
			if (_mDown) 
			{
				if (_step.move()) 
				{
					y += Opt.SPEED;
				}else {	
					
					_mDown = false;
					MyWorld.arrLevel = ChangeArrLevel.setDown(y / 32, x / 32, 9);
					//trace("---------------------");
					//trace(ChangeArrLevel.log());
					_step.reMove();
					
					
				}
			}
			if (_mUp) 
			{
				if (_step.move()) 
				{
					y -= Opt.SPEED;
				}else {	
					
					_mUp = false;
					MyWorld.arrLevel = ChangeArrLevel.setUp(y / 32, x / 32,9);
					_step.reMove();
					
					
				}
			}
		}
		
		private function logMove():void 
		{
			trace("|LEFT:		|", _coll.left, _coll.getLeftEntity(this));
			trace("|RIGHT:	|", _coll.right, _coll.getRightEntity(this));
			trace("|UP:		|", _coll.up, _coll.getUpEntity(this));
			trace("|DOWN:		|", _coll.down, _coll.getDownEntity(this));
			trace("|UP_LEFT:	|", _coll.upLeft, _coll.getUpLeftEntity(this));
			trace("|UP_RIGHT:	|", _coll.upRight, _coll.getUpRightEntity(this));
			trace("|DOWN_LEFT:	|", _coll.downLeft, _coll.getDownLeftEntity(this));
			trace("|DOWN_RIGHT:	|", _coll.downRight, _coll.getDownRightEntity(this));
			trace("-------------------------------------");
		}
		
		private function stepMoveP():void 
		{
			if (_step.moveP) 
			{
				if (_kLeft || MyWorld.kMLeft) 
				{
					if (collide(Opt.WALL,x-1,y) || (_boxL!=null && (!_boxL.leftB || _boxL.gravity)) || (_stoneL!=null && (!_stoneL.leftB || _stoneL.gravity))) 
					{
						_mLeft = false;
					}else {
						_mLeft = true;
					}
					//trace(collide(Opt.WALL,x-1,y) || (_boxL!=null && (!_boxL.leftB || _boxL.gravity)) || (_stoneL!=null && (!_stoneL.leftB || _stoneL.gravity)));
				}
				if (_kRight || MyWorld.kMRight) 
				{
					if (collide(Opt.WALL,x+1,y) || (_boxR!=null && (!_boxR.rightB || _boxR.gravity)) || (_stoneR!=null && (!_stoneR.rightB || _stoneR.gravity))) 
					{
						_mRight = false;
					}else {
						_mRight = true;
					}
				}if (_kDown || MyWorld.kMDown) 
				{
					if (collide(Opt.WALL,x,y+1) || collide(Opt.BOX,x,y+1) || collide(Opt.STONE,x,y+1)) 
					{
						_mDown = false;
					}else {
						_mDown = true;
					}
				}if (_kUp || MyWorld.kMUp) 
				{
					if (collide(Opt.WALL,x,y-1) || collide(Opt.BOX,x,y-1) || collide(Opt.STONE,x,y-1)) 
					{
						_mUp = false;
					}else {
						_mUp = true;
					}
				}
				
			}
		}
		
		private function inputCheck():void 
		{
			if (Input.check("Left")) 
			{
				_kLeft = true;
				_kRight = false;
				_kDown = false;
				_kUp = false;
			}else {
				_kLeft = false;
			}
			if (Input.check("Right")) 
			{
				_kRight = true;
				_kLeft = false;
				_kDown = false;
				_kUp = false;
			}else {
				_kRight = false;
			}
			if (Input.check("Down")) 
			{
				_kDown = true;
				_kRight = false;
				_kLeft = false;
				_kUp = false;
			}else {
				_kDown = false;
			}
			if (Input.check("Up")) 
			{
				_kUp = true;
				_kRight = false;
				_kDown = false;
				_kLeft = false;
			}else {
				_kUp = false;
			}
		}
		
		
		
	}

}