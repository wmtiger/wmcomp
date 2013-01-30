package com.wm.base 
{
	import flash.display.BitmapData;
	
	/**
	 * 皮肤资源都是位图
	 * @author wmtiger
	 */
	public interface IAssets 
	{
		function getSkin(key:String):BitmapData;
	}
	
}