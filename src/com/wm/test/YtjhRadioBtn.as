package com.wm.test
{
	import com.wm.comp.WmRadioBtn;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class YtjhRadioBtn extends WmRadioBtn 
	{
		
		public function YtjhRadioBtn(label:String="单选框", w:int=80, h:int=22) 
		{
			super(label, w, h);
			
		}
		
		override protected function initStyle():void 
		{
			style = "ytjh_radio";
		}
		
		override protected function setSelectedStyle(val:Boolean):void 
		{
			style = val ? "ytjh_radio_selected" : "ytjh_radio";
		}
		
	}

}