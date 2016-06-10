package com.alsial.game.entitys 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.alsial.game.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class Stone extends StaticEntity
	{
		
		private var _nameVec:String = "";
		private var _downStoneB:Boolean;
		private var _col:CollideStaticEntity;
		
		public function Stone(xPos:Number=0,yPos:Number=0,zx:int=0) 
		{
			super(x, y);
			_img = new Image(Res.STONE);
			_bGravity = true;
			type = Opt.STONE;
			setHitbox(32, 32);
			x = xPos * 32;
			y = yPos * 32;
			_id = Opt.ID_STONE;
			_col = new CollideStaticEntity();
			
			_stoneName = "s" + String(zx);
			graphic = _img;
			_pos = new Point(int(y / 32), int(x / 32));
			_col.arrEntity=[Opt.BOX,Opt.DOR,Opt.ENEMY_EVIL,Opt.GROUND,Opt.STAR,Opt.STONE,Opt.THORNS,Opt.TRIGGERBUTTON,Opt.TRIGGERDOOR,Opt.WALL];
			//graphic = new Text(_stoneName);
			
		}
		
		override public function update():void 
		{
			super.update();
			
			
			var gr1:Stone = collide(Opt.STONE, x, y+1) as Stone;
			if (gr1!=null) 
			{
				_downStoneB = (!gr1._xxx);				
			}
			
			rightB=	((_col.getRightEntity(this) == "NULL") &&
					 	(_col.getDownRightEntity(this) == "NULL") &&
						(_col.getUpRightEntity(this) == "NULL"));
			leftB=((_col.getLeftEntity(this) == "NULL") &&
					 	(_col.getDownLeftEntity(this) == "NULL") &&
						(_col.getUpLeftEntity(this) == "NULL"));
						
			//right = (_col.getRightEntity(this) == "NULL")?true:false;
			//down = (_col.getDownEntity(this) == "NULL")?true:false;
			//up = (_col.getUpEntity(this) == "NULL")?true:false;
			//left = (_col.getLeftEntity(this) == "NULL")?true:false;
			// = (_col.getDownLeftEntity(this) == "NULL")?true:false;
			//right = (_col.getDownRightEntity(this) == "NULL")?true:false;
			//right = (_col.getUpLeftEntity(this) == "NULL")?true:false;
			//right = (_col.getUpRightEntity(this) == "NULL")?true:false;
			
			
			
			if(collide(Opt.STONE,x,y+1)){
			
				if (rightB) {
					_xxx = true;	
					rightStoneB = true;
					_img.color = 0x00FF00;
					_img.alpha = .5;
					_nameVec = "R";
					moveRight();
				}else {
					//rightStoneB = false;
					if (leftB) {
						
						//trace(left);
						_leftB = true;
						
					//trace(_stoneName,arr[int(y / 32)+1][int(x / 32)],arr[int(y / 32)][int(x / 32)+1],arr[int(y / 32)-1][int(x / 32)],arr[int(y / 32)][int(x / 32)-1])	
						_img.color = 0x0000FF;
						_img.alpha = .5;
						_nameVec = "L";
						moveLeft();
						_xxx = true;
					}else {
						_xxx = false;
					}
					
					_img.color = 0x00FFFF;
					_img.alpha = .5;	
				}
				if (x%32!=0) 
				{
					
					if (_nameVec=="R") 
					{
						_rightB = true;
						moveRight();
					}
					if (_nameVec=="L") 
					{
						_leftB = true;
						moveLeft();
					}
					
					
										
					_img.color = 0xFF0000;
					_img.alpha = .5;				
				}
			}else {
				_img.color = 0xC0C0C0;
				_img.alpha = 1;		
			}
			
			_pos = new Point(int(y / 32), int(x / 32));
		}
		
		
		
		
	}

}