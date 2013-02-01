package com.wm.comp 
{
	import com.wm.base.IProcessBar;
	import com.wm.mgr.AssetsMgr;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	/**
	 * 进度条组件
	 * eg:
	 * var bar:WmProcessBar = new WmProcessBar(200, 10);
	 * bar.bgStyle = "bg_xx";
	 * pbar.barX = 2;
	 * pbar.barY = 2;
	 * bar.barStyle = null;
	 * bar.barStyle = "bar_xx";//或者下面的,如果这样，得继承，并且重新写style方法
	 * addChild(bar);
	 * @author wmtiger
	 */
	public class WmProcessBar extends WmSprite implements IProcessBar 
	{
		protected var _bgStyle:String;
		protected var _barStyle:String;
		protected var _bar:Bitmap;
		
		protected var _barX:int;
		protected var _barY:int;
		
		public function WmProcessBar(w:int = 100, h:int = 10) 
		{
			_sprWidth = w;
			_sprHeight = h;
			super();
			init();
		}
		
		protected function init():void 
		{
			_bar = new Bitmap();
			addElement(_bar);
		}
		
		override protected function drawDefBg():void 
		{
			this.graphics.clear();
			this.graphics.beginBitmapFill(_bgBmd);
			this.graphics.drawRect(0, 0, _sprWidth, _sprHeight);
			this.graphics.endFill();
		}
		
		public function set bgStyle(val:String):void
		{
			_bgStyle = val;
			
			_bgBmd = getNormalStyle(_bgStyle);
			drawDefBg();
		}
		
		public function set barStyle(val:String):void
		{
			_barStyle = val;
			if (_barStyle == "" || _barStyle == null) 
			{
				var bmd:BitmapData = new BitmapData(_sprWidth - _barX * 2, _sprHeight - _barY * 2, true, 0);
				var shape:Shape = new Shape();
				shape.graphics.beginFill(0x0000ff, 0.8);
				shape.graphics.drawRect(0, 0, bmd.width, bmd.height);
				shape.graphics.endFill();
				bmd.draw(shape);
				_bar.bitmapData = bmd;
				_bar.width = 0;
				return;
			}
			_bar.bitmapData = getNormalStyle(_barStyle, 3);
		}
		
		public function get barY():int 
		{
			return _barY;
		}
		
		public function set barY(value:int):void 
		{
			_barY = value;
			_bar.y = _barY;
		}
		
		public function get barX():int 
		{
			return _barX;
		}
		
		public function set barX(value:int):void 
		{
			_barX = value;
			_bar.x = _barX;
		}
		
		/* INTERFACE com.wm.base.IProcessBar */
		
		public function flush(obj:Object):void 
		{
			_bar.width = int(obj.process > 100 ? 100 : obj.process) / 100 * (_sprWidth - _barX * 2);
		}
		
		override public function dispose():void 
		{
			_bgStyle = null;
			_barStyle = null;
			if (_bar) 
			{
				if (_bar.bitmapData) 
				{
					_bar.bitmapData.dispose();
				}
				_bar = null;
			}
			super.dispose();
		}
		
	}

}