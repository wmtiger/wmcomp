package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * 窗口
	 * @author wmtiger
	 */
	public class WmWnd extends WmSprite 
	{
		private var _wndWidth:int;
		private var _wndHeight:int;
		private var _pivotX:int;
		private var _pivotY:int;
		private var _title:String;
		
		public function WmWnd(w:int = 480, h:int = 300) 
		{
			_wndWidth = w;
			_wndHeight = h;
			init();
			super();
		}
		
		protected function init():void 
		{
			_pivotX = 15;
			_pivotY = 12;
			drawGraphic();
		}
		
		override protected function drawBg():void 
		{
			var bmp:Bitmap = Assets.instance.getSkin(style) as Bitmap;
			_bgBmd = BitmapDataUtil.getBitmapData9Grid(bmp.bitmapData, _wndWidth, _wndHeight, 30, 30, 90, 30);
			drawGraphic(_bgBmd);
		}
		
		private function drawGraphic(bmd:BitmapData = null):void
		{
			this.graphics.clear();
			if (bmd) 
			{
				this.graphics.beginBitmapFill(_bgBmd, null, false);
			}
			else
			{
				this.graphics.beginFill(0, 0);
			}
			this.graphics.drawRect(0, 0, _wndWidth, _wndHeight);
			this.graphics.endFill();
		}
		
	}

}