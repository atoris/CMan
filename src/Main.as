package 
{
	import com.alsial.game.Levels;
	import com.alsial.game.MyWorld;
	import com.alsial.game.StartMenu;
	import com.flashandmath.dg.display.RetroTV;
	//import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class Main extends Engine 
	{
		private var _arr:Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29];
		
		
		public function Main():void 
		{
			
			super(800, 480, 60, false);
			//new Levels;
			FP.screen.color = 0x171717;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			FP.console.enable();
			FP.console.toggleKey = Key.TAB;
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			//FP.world = new MyWorld();
			
			FP.world = new StartMenu();
			//FP.stage.addChild(_tv);
			
			//FP.world = new MyWorld();
			
			//new StartEngine();
			// entry point
			
			// new to AIR? please read *carefully* the readme.txt files!
		}
		override public function init():void 
		{
			super.init();
			
			//trace("HelloFlashPunk");
		}
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		override public function update():void 
		{
			if (Input.pressed(Key.R)) 
			{
				FP.world.removeAll();
				FP.world = new MyWorld();
			}
			super.update();
		}
		
	}
	
}