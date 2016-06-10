
package com.alsial.game.entitys  
{
	import com.alsial.game.Opt;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.alsial.game.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Lava extends Entity
	{
		
		private var _step:StepGame;
		public function Lava(xPos:Number = 0, yPos:Number = 0 ) 
		{
			graphic = new Image(Res);
			type = Opt.LAVA;
			setHitbox(32, 32);
			x = xPos * 32;
			y = yPos * 32;
			_step = new StepGame();
			_step.step = 1;
		}
		override public function update():void 
		{
			super.update();
			
		}
		
	}

}