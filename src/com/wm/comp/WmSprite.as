package com.wm.comp 
{
	import com.wm.base.IDispose;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	/**
	 * 简单精灵、容器
	 * @author wmTiger
	 */
	public class WmSprite extends Sprite implements IDispose
	{
		protected var _bgBmd:BitmapData;//底图的位图数据
		private var _style:String;
		
		public function WmSprite() 
		{
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
		
		/* INTERFACE wm.base.IDispose */
		
		public function dispose():void 
		{
			_style = null;
			if (_bgBmd) 
			{
				_bgBmd.dispose();
				_bgBmd = null;
			}
		}
		
	}

}