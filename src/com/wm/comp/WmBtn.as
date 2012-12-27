package com.wm.comp 
{
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	/**
	 * 简单图形按钮,默认的w和h是根据资源中来的，如果有其他的资源，自己修改
	 * @author wmtiger
	 */
	public class WmBtn extends WmSprite 
	{
		private var _clickHandler:Function;
		private var _enabled:Boolean;
		
		public function WmBtn(w:int = 73, h:int = 19) 
		{
			setWH(w, h);
			super();
			init();
		}
		
		protected function init():void 
		{
			enabled = true;
			drawGraphic();
			this.mouseChildren = false;
			_evtUtil.addEventListener(this, MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			if (_clickHandler != null) 
			{
				_clickHandler.call();
			}
		}
		
		override protected function getBgBmd(bmp:Bitmap):BitmapData 
		{
			return BitmapDataUtil.getBitmapData3Grid(bmp.bitmapData, sprWidth, sprHeight);
		}
		
		public function get enabled():Boolean 
		{
			return _enabled;
		}
		
		public function set enabled(value:Boolean):void 
		{
			_enabled = value;
			if (_enabled) 
			{
				this.alpha = 1;
				this.buttonMode = true;
			}
			else
			{
				this.alpha = 0.5;
				this.buttonMode = false;
			}
		}
		
		public function set clickHandler(value:Function):void 
		{
			_clickHandler = value;
		}
		
		override public function dispose():void 
		{
			_clickHandler = null;
			super.dispose();
		}
		
	}

}