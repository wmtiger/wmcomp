package com.wm.comp 
{
	/**
	 * 单选框-单行
	 * @author wmtiger
	 */
	public class WmRadioBtn extends WmChkBox 
	{
		
		public function WmRadioBtn(label:String = "单选框", w:int = 80, h:int = 22) 
		{
			super(label, w, h);
			
		}
		
		override protected function initStyle():void 
		{
			style = "radiobtn_def";
		}
		
		override protected function setSelectedStyle(val:Boolean):void 
		{
			style = val ? "radiobtn_def_selected" : "radiobtn_def";
		}
		
	}

}