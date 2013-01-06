package com.wm.test 
{
	import com.wm.assets.Assets;
	import com.wm.base.IStyle;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	/**
	 * 作为样式背景使用
	 * @author wmtiger
	 */
	public class WmStyleShape extends Shape 
	{
		private var _bmd:BitmapData;
		private var _style:String;
		private var _type:String;
		private var _wmWidth:int;
		private var _wmHeight:int;
		
		public function WmStyleShape() 
		{
			super();
			
		}
		
		protected function drawGraphic(bmd:BitmapData = null):void
		{
			this.graphics.clear();
			this.graphics.beginBitmapFill(bmd, null, false);
			this.graphics.drawRect(0, 0, bmd.width, bmd.height);
			this.graphics.endFill();
		}
		
		/* INTERFACE com.wm.base.IStyle */
		
		public function setStyleAndType(style:String, type:String):void 
		{
			_style = style;
			_type = type;
			
			var bmp:Bitmap = Assets.instance.getSkinByType(style, type) as Bitmap;
			_bmd = bmp.bitmapData;
			drawGraphic(_bmd);
			bmp = null;
		}
		
		public function get style():String 
		{
			return _style;
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function dispose():void
		{
			if (_bmd) 
			{
				_bmd.dispose();
				_bmd = null;
			}
			_style = null;
			_type = null;
		}
		
	}

}