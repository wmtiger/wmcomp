package com.wm.comp 
{
	/**
	 * 默认的面板
	 * @author wmtiger
	 */
	public class WmPanel extends WmBackGround 
	{
		
		public function WmPanel(w:int = 100, h:int = 100) 
		{
			super(w, h);
			this.mouseChildren = true;
			initPanel();
		}
		
		protected function initPanel():void 
		{
			this.style = "def_list_bg";
		}
		
	}

}