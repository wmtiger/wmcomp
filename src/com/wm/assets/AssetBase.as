package com.wm.assets 
{
	import com.wm.base.IAssets;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * 素材引用基类
	 * @author wmtiger
	 */
	public class AssetBase
	{
		
		public function AssetBase() 
		{
			
		}
		
		/* INTERFACE com.wm.base.IAssets */
		
		public function getSkin(key:String):Bitmap 
		{
			var skin:Bitmap;
			if (this.hasOwnProperty(key)) 
			{
				skin = new (this[key])();
			}
			return skin;
		}
		
	}

}