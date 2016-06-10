package com.alsial.game.entitys
 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import com.alsial.game.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Star extends StaticEntity 
	{
		
		/*private var _tMin:int = 0;
		private var _tMax:int = 32;
		private var _gravity:Boolean;
		private var _push:Boolean;
		private var _altitude:int = 0;
		
		private var _pos:Number;*/
		public function Star(xPos:Number=0,yPos:Number=0) 
		{
			//super(x, y, graphic, mask);
			graphic = new Image(Res.STAR);
			type = Opt.STAR;
			setHitbox(32, 32);
			
			x = xPos * 32;
			y = yPos * 32;
			_id = 7;
			_bGravity = false;
			active = false;
			//infoCollide();
		}
		
		
		override public function destroy():void 
		{
			super.destroy();
			Opt.maxStar--;
			Opt.score++;
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (collide(Opt.PLAYER,x,y)) 
			{
				destroy();
			}
			
			
		}
	}

}