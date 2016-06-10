package com.alsial.game.entitys 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	import com.alsial.game.Opt;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Dor extends Entity
	{
		
		public function Dor(xPos:Number=0,yPos:Number=0) 
		{
			super(x, y);
			//_img = new Image(Res.STONE);
			//_bGravity = true;
			type = Opt.DOR;
			setHitbox(32, 32);
			x = xPos * 32;
			y = (yPos * 32)-16;
			var txt:Text = new Text("o");
			txt.scale = 3;
			graphic = txt;
			graphic.visible = false;
			
		}
		
		override public function update():void 
		{
			super.update();
			if (Opt.maxStar==0) 
			{
				graphic.visible = true;
			}
		}
		
	}

}