package com.alsial.game
 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class StartEngine extends Engine 
	{
		
		public function StartEngine() 
		{
			super(640, 480, 30, false);
			FP.world = new MyWorld();
		}
		
		
	}

}