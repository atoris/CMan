package com.alsial.game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Atoris
	 */
	public class ScrollOptions extends Entity
	{
		private var sprSwordguy:Spritemap = new Spritemap(Res.SCROLL, 150, 48);
		
		private var _num:int = 100;
		public function ScrollOptions() 
		{
			super();
			x = 0;
			y = 48;
			setHitbox(150, 48);
			sprSwordguy.add("0", [0], 20, true);
			sprSwordguy.add("5", [1], 20, true);
			sprSwordguy.add("10", [2], 20, true);
			sprSwordguy.add("15", [3], 20, true);
			sprSwordguy.add("20", [4], 20, true);
			sprSwordguy.add("25", [5], 20, true);
			sprSwordguy.add("30", [6], 20, true);
			sprSwordguy.add("35", [7], 20, true);
			sprSwordguy.add("40", [8], 20, true);
			sprSwordguy.add("45", [9], 20, true);
			sprSwordguy.add("50", [10], 20, true);
			sprSwordguy.add("55", [11], 20, true);
			sprSwordguy.add("60", [12], 20, true);
			sprSwordguy.add("65", [13], 20, true);
			sprSwordguy.add("70", [14], 20, true);
			sprSwordguy.add("75", [15], 20, true);
			sprSwordguy.add("80", [16], 20, true);
			sprSwordguy.add("85", [17], 20, true);
			sprSwordguy.add("90", [18], 20, true);
			sprSwordguy.add("95", [19], 20, true);
			sprSwordguy.add("100", [20], 20, true);
			sprSwordguy.play("95");
			graphic = sprSwordguy;
			
		}
		
		public function minus():void 
		{
			if (_num>0) 
			{
				_num -= 1;
			}
			if (_num%5==0) 
			{
				sprSwordguy.play(String(_num));
			}
			
		}
		public function plus():void 
		{
			if (_num<100) 
			{
				_num += 1;
			}
			if (_num%5==0) 
			{
				sprSwordguy.play(String(_num));
			}
		}
		
	}

}