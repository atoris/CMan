package com.alsial.game 
{
	import com.alsial.game.entitys.TriggerButton;
	/**
	 * ...
	 * @author Atoris
	 */
	public class TriggerClass 
	{
		
		public function TriggerClass() 
		{
			
		}
		
		public function reActive(tb:TriggerButton):void 
		{
			if (tb.activeB) 
			{
				
				
				for (var i:int = 0; i < MyWorld.arrDoor.length; i++) 
				{
					MyWorld.arrDoor[i].activeB = !MyWorld.arrDoor[i].activeB;	
					MyWorld.arrDoor[i].reActive();		
									
				}
				
				
				tb.activeB = false;
				tb.reActive();
				
				for (var j:int = 0; j < MyWorld.arrButton.length; j++) 
				{
					if (MyWorld.arrButton[j]!=tb) 
					{
						MyWorld.arrButton[j].activeB = !MyWorld.arrButton[j].activeB;
						MyWorld.arrButton[j].reActive();
					}
					
						
				}
			}
			
		}
		
		
	}

}