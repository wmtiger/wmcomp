package com.wm.test 
{
	import com.wm.comp.WmTextInput;
	
	/**
	 * ...
	 * @author wmTiger
	 */
	public class YTextInput extends WmTextInput 
	{
		
		public function YTextInput(w:int=120, h:int=24) 
		{
			super(w, h);
			
		}
		
		override protected function initInfo():void 
		{
			_itemX = 2;
			_itemY = 2;
			style = "ytjh_bg";
		}
		
		override protected function initEvt():void 
		{
			//不需要
		}
		
	}

}