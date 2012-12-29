package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	/**
	 * 滑块-横向
	 * @author wmtiger
	 */
	public class WmSlider extends WmSprite 
	{
		private var _slider:WmBtn;
		private var _bar:Bitmap;
		private var _dragRect:Rectangle;
		private var _sliderWidth:int;
		private var _sliderHeight:int;
		private var _progress:Number;
		
		public function WmSlider(w:int = 150, h:int = 4) 
		{
			_sliderWidth = w;
			_sliderHeight = h;
			_progress = 0;
			_dragRect = new Rectangle();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			init();
		}
		
		private function init():void 
		{
			_bar = new Bitmap();
			addChild(_bar);
			_slider = new WmBtn(14, 20);
			_slider.style = "slider_def";
			addChild(_slider);
			_slider.buttonMode = false;
			flushBarPosition();
			_dragRect.width = _sliderWidth - _slider.width;
			_slider.addEventListener(MouseEvent.MOUSE_DOWN, onMouse_down);
		}
		
		private function onMouse_up(e:MouseEvent):void 
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouse_up);
			_slider.stopDrag();
			_progress = Number((_slider.x / _dragRect.width).toFixed(2));
			trace(_progress);
		}
		
		private function onMouse_down(e:MouseEvent):void 
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouse_up);
			_slider.startDrag(false, _dragRect);
		}
		
		private function flushBarPosition():void 
		{
			_bar.bitmapData = getBarStyle("sliderBar_def");
			_bar.y = _slider.height - _bar.height >> 1;
		}
		
		protected function getBarStyle(style:String):BitmapData
		{
			var bmp:Bitmap = Assets.instance.getSkinByType(style, "normal") as Bitmap;
			if (bmp == null) return null;
			if (chkBgBmd(bmp)) 
			{
				return bmp.bitmapData.clone();
			}
			return BitmapDataUtil.getBitmapData3Grid(bmp.bitmapData, _sliderWidth, _sliderHeight);
		}
		
		protected function chkBgBmd(bmp:Bitmap):Boolean
		{
			return bmp.width == _sliderWidth && bmp.height == _sliderHeight;
		}
		
		public function get progress():Number 
		{
			return _progress;
		}
		
		override public function dispose():void 
		{
			super.dispose();
			if (stage) 
			{
				stage.removeEventListener(MouseEvent.MOUSE_UP, onMouse_up);
			}
			if (_slider) 
			{
				_slider.removeEventListener(MouseEvent.MOUSE_DOWN, onMouse_down);
				_slider.dispose();
				_slider = null;
			}
			if (_bar) 
			{
				if (_bar.bitmapData) 
				{
					_bar.bitmapData.dispose();
					_bar.bitmapData = null;
				}
				_bar = null;
			}
			_dragRect = null;
		}
		
	}

}