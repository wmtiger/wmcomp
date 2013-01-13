package com.wm.comp 
{
	import com.wm.base.IScroll;
	import flash.events.Event;
	import flash.geom.Rectangle;
	/**
	 * 滚动条
	 * @author wmtiger
	 */
	public class WmScroll extends WmSprite 
	{
		protected var _totalHeight:int;
		protected var _upBtn:WmBtn;
		protected var _downBtn:WmBtn;
		protected var _sliderBtn:SliderBtn;
		protected var _scrollPath:WmBackGround;//负责整个滚动条的长宽
		protected var _progress:Number;//滑块百分比
		protected var _sliderRect:Rectangle;
		protected var _sliderSpace:int;//滑块可以滑动的区间
		protected var _space:int;//滑块和按钮之间的间隔
		protected var _handler:IScroll;
		
		public function WmScroll(handler:IScroll, w:int = 17, h:int = 100) 
		{
			_handler = handler;
			_space = 1;
			_progress = 0;
			_sliderRect = new Rectangle();
			setWH(w, h);
			initScrollView();
			resetPosition();
		}
		
		override protected function drawDefBg():void { }
		
		protected function initScrollView():void 
		{
			initScrollPath();
			initScrollUp();
			initScrollDown();
			initScrollSlider();
		}
		protected function initScrollPath():void
		{
			_scrollPath = new WmBackGround(sprWidth, sprHeight);
			_scrollPath.style = "scroll_path_def";
			addChild(_scrollPath);
		}
		protected function initScrollUp():void
		{
			_upBtn = new WmBtn(16,16);
			addChild(_upBtn);
			_upBtn.style = "scroll_up_def";
			_upBtn.buttonMode = false;
			_upBtn.x = 1;
			_upBtn.y = 1;
			_upBtn.clickHandler = function ():void 
			{
				_handler.scrollUp();
			}
		}
		protected function initScrollDown():void
		{
			_downBtn = new WmBtn(16, 16);
			addChild(_downBtn);
			_downBtn.style = "scroll_down_def";
			_downBtn.buttonMode = false;
			_downBtn.x = 1;
			_downBtn.clickHandler = function ():void 
			{
				_handler.scrollDown();
			}
		}
		protected function initScrollSlider():void
		{
			_sliderBtn = new SliderBtn();
			addChild(_sliderBtn);
			_sliderBtn.x = 1;
			
			_sliderBtn.downHandler = down;
			
			_sliderBtn.upHandler = up;
		}
		private function down():void
		{
			_sliderBtn.startDrag(false, _sliderRect);
			if (!this.hasEventListener(Event.ENTER_FRAME))
				this.addEventListener(Event.ENTER_FRAME, onLoop);
		}
		private function up():void
		{
			_sliderBtn.stopDrag();
			this.removeEventListener(Event.ENTER_FRAME, onLoop);
		}
		
		private function onLoop(e:Event):void 
		{
			_progress = (_sliderBtn.y - _upBtn.y - _upBtn.height - _space) / (_sliderSpace - _sliderBtn.height);
			_handler.scrollPosition(_progress);
		}
		
		protected function resetPosition():void
		{
			_sliderSpace = sprHeight - _upBtn.height - _downBtn.height - 4;
			
			_scrollPath.setWH(sprWidth, sprHeight, true);
			
			_downBtn.y = sprHeight - 1 - _downBtn.height;
			
			_sliderBtn.y = _upBtn.y + _upBtn.height + _space + _progress * _sliderSpace;
			
		}
		
		/**
		 * 刷新滚动条中间的条的长度
		 * @param	p		百分比
		 */
		public function flushSliderHeight(p:Number):void 
		{
			var h:int = _sliderSpace * p;
			_sliderBtn.setWH(16, h , true);
			_sliderRect.x = _sliderBtn.x;
			_sliderRect.y = _upBtn.y + _upBtn.height + _space;
			_sliderRect.height = _sliderSpace - _sliderBtn.compHeight;
		}
		
	}

}

import com.wm.utils.BitmapDataUtil;
import flash.display.Bitmap;
import flash.display.BitmapData;
import com.wm.comp.WmBtn;
import flash.events.MouseEvent;

class SliderBtn extends WmBtn
{
	protected var _minHeight:int = 20;//滑块最小高度
	
	public function SliderBtn(w:int = 15, h:int = 20)
	{
		super(w, h);
		buttonMode = false;
	}
	
	override protected function onCompMDown(e:MouseEvent):void 
	{
		super.onCompMDown(e);
		
		if (stage) 
			stage.addEventListener(MouseEvent.MOUSE_UP, onStageUp);
	}
	
	override public function setWH(w:int, h:int, draw:Boolean = false):void 
	{
		h = h >= _minHeight ? h : _minHeight;
		super.setWH(w, h, draw);
	}
	
	private function onStageUp(e:MouseEvent):void 
	{
		if (_upHandler != null) 
		{
			_upHandler.call();
		}
		if (stage) 
			stage.removeEventListener(MouseEvent.MOUSE_UP, onStageUp);
	}
	
	override protected function initComp(w:int, h:int):void 
	{
		setWH(w, h);
		style = "scroll_slider_def";
		
		this.mouseChildren = false;
	}
	
	override protected function getBgBmd(bmp:Bitmap):BitmapData 
	{
		if (chkBgBmd(bmp)) 
		{
			return bmp.bitmapData.clone();
		}
		return BitmapDataUtil.getBitmapData3Grid(bmp.bitmapData, compWidth, compHeight, "tp", 5, 5);
	}
}