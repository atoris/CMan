package
{
	import flash.display.Sprite;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	
	import worlds.TestBed;
	
	public class Main_2 extends Engine
	{
		public function Main_2()
		{
			super(640, 480, 60);	
			FP.console.enable();
			FP.console.toggleKey = Key.TAB;
			
			FP.world = new TestBed();
			
		}
	}
}