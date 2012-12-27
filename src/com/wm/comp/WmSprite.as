package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.base.IDispose;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * 简单精灵、容器
	 * @author wmTiger
	 */
	public class WmSprite extends Sprite implements IDispose
	{
		private var _bgBmd:BitmapData;//底图的位图数据
		private var _style:String;
		
		public function WmSprite() 
		{
			super();
			
		}
		
		//画背景图
		protected function drawBg():void
		{
			//var disp:DisplayObject = Assets.instance.getSkin(_style) as DisplayObject;
			//var bmd:BitmapData = new BitmapData(disp.width, disp.height, true, 0);
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
			
		}
		
	}

}