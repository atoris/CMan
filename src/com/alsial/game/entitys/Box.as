
package com.alsial.game.entitys  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import com.alsial.game.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Box extends StaticEntity
	{
		
		
		/*private var _step:StepGame;
		//private const Opt.SPEED:int = 4;
		private var _leftB:Boolean;
		private var _rightB:Boolean;
		private var _tMin:int = 0;
		private var _tMax:int = 32;
		private var _gravity:Boolean;
		private var _push:Boolean;
		private var _altitude:int = 0;*/
		//private var _mWorld:MyWorld;
		public function Box(xPos:Number=0, yPos:Number=0) 
		{
			//super(x, y, graphic, mask);
			graphic = new Image(Res.BOX);
			type = Opt.BOX;
			setHitbox(32, 32);
			x = xPos * 32;
			y = yPos * 32;
			_bGravity = true;
			_id = 1;
			
		}
		
		override public function update():void 
		{
			super.update();
			//trace(_altitude);
			
			if (_altitude>=32 && arr[int(y/32+1)][int(x/32)]!=0) 
			{
				destroy();
				addStar();
				var box:Box = collide(Opt.BOX, x, y + 1) as Box;
			
				if (box) 
				{
					
					box.destroy();
					box.addStar();
				}
				
				
			}
			
			
			var stone:Stone = collide(Opt.STONE, x, y - 1) as Stone;
				
			if (stone && stone._altitude>=32) 
			{
				
				destroy();
				addStar();
			}
			
		}
	}

}