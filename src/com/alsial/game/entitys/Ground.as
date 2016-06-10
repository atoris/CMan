
package com.alsial.game.entitys  
{
	import flash.display.DisplayObject;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import com.alsial.game.*;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Ground extends Entity 
	{
		
		public function Ground(xPos:Number=0, yPos:Number=0) 
		{
			graphic = new Image(Res.GROUND);
			setHitbox(32, 32);
			type = Opt.GROUND;
			x = xPos * 32;
			y = yPos * 32;
			active = false;;
		}
		override public function update():void 
		{
			trace("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
			super.update();
		}
		public function destroy():void 
		{
			FP.world.remove(this);
		}
		private function remove():void 
		{
			
		}
		
	}

}