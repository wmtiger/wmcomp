package com.wm.test
{
	import com.wm.comp.WmChkBox;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class YtjhChkBox extends WmChkBox 
	{
		
		public function YtjhChkBox(label:String="多选框", w:int=80, h:int=22) 
		{
			super(label, w, h);
			
		}
		
		override protected function initStyle():void 
		{
			style = "ytjh_chkbox";
		}
		
		override protected function setSelectedStyle(val:Boolean):void 
		{
			style = val ? "ytjh_chkbox_selected" : "ytjh_chkbox";
		}
		
	}

}