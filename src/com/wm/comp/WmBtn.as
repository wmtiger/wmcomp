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
	public class WmBtn extends WmComp 
	{
		private var _clickHandler:Function;
		private var _enabled:Boolean;
		
		public function WmBtn(w:int = 73, h:int = 19) 
		{
			super(w, h);
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			setWH(w, h, true);
			init();
		}
		
		protected function init():void 
		{
			enabled = true;
			this.mouseChildren = false;
			_evtUtil.addEventListener(this, MouseEvent.CLICK, onClick);
			_evtUtil.addEventListener(this, MouseEvent.MOUSE_OVER, onMOver);
			_evtUtil.addEventListener(this, MouseEvent.MOUSE_OUT, onMOut);
			_evtUtil.addEventListener(this, MouseEvent.MOUSE_DOWN, onMDown);
			_evtUtil.addEventListener(this, MouseEvent.MOUSE_UP, onMUp);
		}
		
		private function onMUp(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			setCrtBgBmd("over");
		}
		
		private function onMOut(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			setCrtBgBmd("normal");
		}
		
		private function onMDown(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			setCrtBgBmd("down");
		}
		
		private function onMOver(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			setCrtBgBmd("over");
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
			return BitmapDataUtil.getBitmapData3Grid(bmp.bitmapData, compWidth, compHeight);
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
			super.dispose();
			_clickHandler = null;
		}
		
	}

}