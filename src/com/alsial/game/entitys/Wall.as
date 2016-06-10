package com.alsial.game.entitys 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import com.alsial.game.*;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class Wall extends Entity 
	{
		
		public function Wall(xPos:Number=0, yPos:Number=0) 
		{
			//super(x, y, graphic, mask);
			graphic = new Image(Res.WALL);
			type = Opt.WALL;
			setHitbox(32, 32);
			x = xPos * 32;
			y = yPos * 32;
			active = false;
		}
		
	}

}