
package com.alsial.game  
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import com.alsial.game.entitys.*;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Atoris
	 */
	public class MyWorld extends World
	{
		/**
		 * массив уровня
		 */
		
		public static var arrLevel:Array;
		public static var arrDoor:Array;
		public static var arrButton:Array;
		private var _txtScore:Text;
		private var _txtStep:Text;
		
		private var _step:StepGame;
		private var _txtFPS:Text;
		
		private var _bLeft:Entity;
		private var _bRight:Entity;
		private var _bDown:Entity;
		private var _bUp:Entity;
		
		
		private var _txtBtn:String;
		
		public static var kMLeft:Boolean;
		public static var kMRight:Boolean;
		public static var kMDown:Boolean;
		public static var kMUp:Boolean;
		private var _changeArrLevel:ChangeArrLevel;
		
		public function MyWorld() 
		{
			//add(new Player());
			//_sLeft = new Image(_LEFT);
			//_sRight = new Image(_RIGHT);
			//_sDown = new Image(_DOWN);
			//_sUp = new Image(_UP);
			startWorld();
			
			
			//addGraphic(_txtScore);
			//addGraphic(_txtStep);
			//addGraphic(_txtFPS);
			
		}
		
		private function startWorld():void 
		{
			var _lvl:Levels = new Levels();
			arrLevel = _lvl.arrLevel;
			_txtScore = new Text("Score: " + Opt.score, 36, 36);
			_txtStep = new Text("CLICK: " + Opt.step, 36, 52);
			_txtFPS = new Text("FPS: "+int(FP.frameRate),36,68);
			arrDoor = new Array();
			arrButton = new Array();
			_changeArrLevel = new ChangeArrLevel();
			var zx:int = 0;
			
			for (var n:int = 0; n < arrLevel.length; n++) 
			{
				for (var o:int = 0; o < arrLevel[n].length; o++) 
				{
					if (arrLevel[n][o]==14) 
					{
						var th:Thorns = new Thorns(o, n, false );
						add(th);
						//arrButton.push(tb);
					}
					if (arrLevel[n][o]==15) 
					{
						th = new Thorns(o, n,true);
						add(th);
						//arrButton.push(tb);
					}
				}
			}
			
			
			for (var i:int = 0; i < arrLevel.length; i++) 
			{
				for (var j:int = 0; j < arrLevel[i].length; j++) 
				{
					if (arrLevel[i][j]==2) 
					{
						add(new Wall(j,i));
					}
					
					
					
					
					if (arrLevel[i][j]==6) 
					{
						add(new Ground(j, i));
					}
					if (arrLevel[i][j]==1) 
					{
						add(new Box(j, i));
					}
					if (arrLevel[i][j]==7) 
					{
						add(new Star(j, i));
						Opt.maxStar++;
					}
					if (arrLevel[i][j]==3) 
					{
						add(new Stone(j, i,zx));
						zx++;
					}
					
					if (arrLevel[i][j]==12) 
					{
						var tb:TriggerButton = new TriggerButton(j, i, true);
						add(tb);
						arrButton.push(tb);
					}
					if (arrLevel[i][j]==13) 
					{
						tb = new TriggerButton(j, i, false);
						add(tb);
						arrButton.push(tb);
					}
					
					
					
					
					if (arrLevel[i][j]==10) 
					{
						var td:TriggerDoor=new TriggerDoor(j,i);
						//add(th);
						//arrDoor.push(td);
					}
					if (arrLevel[i][j]==11) 
					{
						td=new TriggerDoor(j,i,false);
						add(td);
						arrDoor.push(td);
					}
					
					
					if (arrLevel[i][j]==4) 
					{
						add(new Dor(j,i));
						zx++;
					}
				}
			}
			
			
			for (var m:int = 0; m < arrLevel.length; m++) 
			{
				trace(arrLevel[m]);
			}
			
			
			for (var k:int = 0; k < arrLevel.length; k++) 
			{
				for (var l:int = 0; l < arrLevel[k].length; l++) 
				{
					if (arrLevel[k][l]==9) 
					{
						add(new Player(l,k));
					}
					if (arrLevel[k][l]==8) 
					{
						add(new EnemyEvil(l,k));
					}
				}
			}
			
			//_step = new StepGame();
			//_step.step = 1;
		}
		
		
		override public function update():void 
		{
			super.update();
			_txtScore.text = "Score: " + Opt.score;
			_txtStep.text = "CLICK: " + _txtBtn;
			_txtFPS.text = "FPS: " + int(FP.frameRate);
			
			
			
			
			if (Input.pressed(Key.ESCAPE)) 
			{
				FP.world.removeAll();
				FP.world = new StartMenu();
			}
			if (Input.pressed(Key.N)) 
			{
				Opt.numLevel--;
				FP.world.removeAll();
				FP.world = new MyWorld();
			}
			/*
			if (_bLeft.collidePoint(_bLeft.x,_bLeft.y,Input.mouseX,Input.mouseY) && Input.mouseDown) 
			{
				_txtBtn = "LEFT";
				kMLeft = true;
			}else {
				kMLeft = false;
			}
			if (_bRight.collidePoint(_bRight.x,_bRight.y,Input.mouseX,Input.mouseY) && Input.mouseDown) 
			{
				_txtBtn = "RIGHT";
				kMRight = true;
			}else {
				kMRight = false;
			}
			if (_bDown.collidePoint(_bDown.x,_bDown.y,Input.mouseX,Input.mouseY) && Input.mouseDown) 
			{
				_txtBtn = "DOWN";
				kMDown = true;
			}else {
				kMDown = false;
			}
			if (_bUp.collidePoint(_bUp.x,_bUp.y,Input.mouseX,Input.mouseY) && Input.mouseDown) 
			{
				_txtBtn = "UP";
				kMUp = true;
			}else {
				kMUp = false;
			}*/
			
		}
		
		override public function begin():void 
		{
			/*
			_bLeft = addGraphic(new Image(Res.LEFT), 0, 20, Opt.SH - 100);
			_bRight = addGraphic(new Image(Res.RIGHT), 0, 100, Opt.SH - 100);
			
			_bDown = addGraphic(new Image(Res.DOWN), 0, Opt.SW - 100, Opt.SH - 100);
			_bUp = addGraphic(new Image(Res.UP), 0, Opt.SW - 100, Opt.SH - 200);
			
			_bLeft.setHitbox(80,80);
			_bRight.setHitbox(80,80);
			_bDown.setHitbox(80,80);
			_bUp.setHitbox(80,80);
			
			*/
			
			
			super.begin();
		}
		
		
	}

}