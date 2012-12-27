package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.base.IDispose;
	import com.wm.base.IPosition;
	import com.wm.utils.BitmapDataUtil;
	import com.wm.utils.EventListenerUtil;
	import flash.display.Bitmap;
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
		private var _sprWidth:int;//当前的spr的宽
		private var _sprHeight:int;//当前的spr的高
		
		public function WmSprite() 
		{
			_evtUtil = new EventListenerUtil();
			super();
		}
		
		//画背景图
		protected function drawBg():void
		{
			if (style == null || style == "") 
			{
				drawGraphic();//此处要注意画的背景图是矢量透明图，在移动平台可能要修改
				return;
			}
			var bmp:Bitmap = Assets.instance.getSkin(style) as Bitmap;
			var bmd:BitmapData = getBgBmd(bmp);
			drawGraphic(bmd);
			if (_bgBmd) 
			{
				_bgBmd.dispose();
				_bgBmd = null;
			}
			_bgBmd = bmd;
		}
		
		//需要改变获取位图的正确图像，必须覆盖此方法
		protected function getBgBmd(bmp:Bitmap):BitmapData
		{
			return null;
		}
		
		protected function drawGraphic(bmd:BitmapData = null):void
		{
			this.graphics.clear();
			if (bmd) 
			{
				this.graphics.beginBitmapFill(bmd, null, false);
			}
			else
			{
				if (_sprWidth == 0 || _sprHeight == 0) 
				{
					return;
				}
				this.graphics.beginFill(0, 0);
			}
			this.graphics.drawRect(0, 0, _sprWidth, _sprHeight);
			this.graphics.endFill();
		}
		
		public function setWH(w:int, h:int):void
		{
			_sprWidth = w;
			_sprHeight = h;
			drawBg();
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
		
		public function get sprWidth():int 
		{
			return _sprWidth;
		}
		
		public function set sprWidth(value:int):void 
		{
			_sprWidth = value;
			drawBg();
		}
		
		public function get sprHeight():int 
		{
			return _sprHeight;
		}
		
		public function set sprHeight(value:int):void 
		{
			_sprHeight = value;
			drawBg();
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