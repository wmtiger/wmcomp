package com.wm.comp 
{
	import com.wm.base.IDispose;
	import com.wm.base.IPosition;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	/**
	 * 简单精灵、容器
	 * @author wmTiger
	 */
	public class WmSprite extends Sprite implements IDispose, IPosition
	{
		protected var _bgBmd:BitmapData;//底图的位图数据，实际显示用的是这个
		
		private var _left:int;
		private var _right:int;
		private var _top:int;
		private var _bottom:int;
		
		protected var _sprWidth:int;
		protected var _sprHeight:int;
		
		public function WmSprite() 
		{
			super();
		}
		
		public function setWH(w:int, h:int, draw:Boolean = false):void
		{
			_sprWidth = w;
			_sprHeight = h;
			if (_sprWidth == 0 || _sprHeight == 0) 
				return;
			if (!draw) 
				return;
			drawDefBg();
		}
		protected function drawDefBg():void
		{
			this.graphics.clear();
			this.graphics.beginFill(0, 0);
			this.graphics.drawRect(0, 0, _sprWidth, _sprHeight);
			this.graphics.endFill();
		}
		
		public function get sprWidth():int 
		{
			return _sprWidth;
		}
		
		public function get sprHeight():int 
		{
			return _sprHeight;
		}
		
		public function flushPosition():void
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
			if (this.parent) 
			{
				this.parent.removeChild(this);
			}
			if (_bgBmd) 
			{
				_bgBmd.dispose();
				_bgBmd = null;
			}
		}
		
	}

}