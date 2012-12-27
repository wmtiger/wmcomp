package com.wm.comp 
{
	import com.wm.base.IDispose;
	import com.wm.base.IPosition;
	import com.wm.utils.EventListenerUtil;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	/**
	 * 简单精灵、容器
	 * @author wmTiger
	 */
	public class WmSprite extends Sprite implements IDispose, IPosition
	{
		protected var _bgBmd:BitmapData;//底图的位图数据
		protected var _evtUtil:EventListenerUtil;
		private var _style:String;
		private var _left:int;
		private var _right:int;
		private var _top:int;
		private var _bottom:int;
		
		public function WmSprite() 
		{
			_evtUtil = new EventListenerUtil();
			super();
		}
		
		//画背景图
		protected function drawBg():void
		{
			
		}
		
		public function get style():String 
		{
			return _style;
		}
		
		public function set style(value:String):void 
		{
			_style = value;
			
			drawBg();
		}
		
		public function reflush():void
		{
			right = _right;
			left = _left;
			bottom = _bottom;
			top = _top;
		}
		
		/* INTERFACE com.wm.base.IPosition */
		
		public function set left(value:Object):void 
		{
			_left = int(value);
			if (this.parent) 
			{
				this.x = _left;
			}
		}
		
		public function set right(value:Object):void 
		{
			_right = int(value);
			if (this.parent) 
			{
				this.x = this.parent.width - this.width - _right;
			}
		}
		
		public function set top(value:Object):void 
		{
			_top = int(value);
			if (this.parent) 
			{
				this.y = _top;
			}
		}
		
		public function set bottom(value:Object):void 
		{
			_bottom = int(value);
			if (this.parent) 
			{
				this.y = this.parent.height - this.height - _bottom;
			}
		}
		
		/* INTERFACE wm.base.IDispose */
		
		public function dispose():void 
		{
			_style = null;
			if (_bgBmd) 
			{
				_bgBmd.dispose();
				_bgBmd = null;
			}
			if (_evtUtil) 
			{
				_evtUtil.dispose();
				_evtUtil = null;
			}
		}
		
	}

}