package com.alsial.game.entitys 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import com.alsial.game.Opt;
	import com.alsial.game.MyWorld;
	import com.alsial.game.Res;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Atoris
	 */
	public class TriggerButton extends Entity
	{
		private var _img:Image;
		public var activeB:Boolean;
		public var _bool:Boolean;
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, 32, 32);
		public function TriggerButton(xPos:Number = 0, yPos:Number = 0, active:Boolean = true ) 
		{
			activeB = active;
			sprSwordguy.add("y", [14], 20, true);
			sprSwordguy.add("n", [15], 20, true);
			graphic = sprSwordguy;
			
			if (activeB) 
			{
				sprSwordguy.play("y");
			}else {
				sprSwordguy.play("n");	
			}
			
			
			type = Opt.TRIGGERBUTTON;
			setHitbox(32, 32);
			x = xPos * 32;
			y = yPos * 32;
			_bool = true;
			
			active = false;
		}
		
		
		
		
		public function reActive():void 
		{
			
			if (activeB) 
			{
				sprSwordguy.play("y");
			}else {
				sprSwordguy.play("n");
			}			
			
		}
		
	}

}