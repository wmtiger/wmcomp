package com.wm.comp 
{
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * 带背景单行输入框
	 * @author wmTiger
	 */
	public class WmTextInput extends WmSprite 
	{
		private var _input:WmInput;
		
		public function WmTextInput(w:int = 120, h:int = 24) 
		{
			setWH(w, h);
			super();
			init();
		}
		
		private function init():void 
		{
			_input = new WmInput();
			addChild(_input);
			_input.x = 2;
			_input.y = 2;
			flushInputWidth();
		}
		
		private function flushInputWidth():void
		{
			_input.width = sprWidth - _input.x * 2;
		}
		
		override protected function getBgBmd(bmp:Bitmap):BitmapData 
		{
			return BitmapDataUtil.getBitmapData9Grid(bmp.bitmapData, sprWidth, sprHeight, 5, 5, 5, 5);
		}
		
		public function set size(val:Object):void
		{
			_input.setFormat( { "size":int(val) } );
			sprHeight = _input.height + 4;
		}
		
		override public function set sprWidth(value:int):void 
		{
			super.sprWidth = value;
			flushInputWidth();
		}
		
	}

}