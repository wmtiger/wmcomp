package com.wm.test 
{
	import com.wm.comp.WmTextInput;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 * ytjh带背景的单行输入框
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
		
		override protected function getBgBmd(bmp:Bitmap):BitmapData 
		{
			if (chkBgBmd(bmp)) 
			{
				return bmp.bitmapData.clone();
			}
			return BitmapDataUtil.getBitmapData9Grid(bmp.bitmapData, compWidth, compHeight, 20, 20, 6, 6);
		}
		
		override protected function initEvt():void 
		{
			//不需要
		}
		
	}

}