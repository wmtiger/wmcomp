package com.wm.assets 
{
	import adobe.utils.CustomActions;
	import com.wm.base.IAssets;
	import com.wm.utils.HashTable;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 图片集素材类
	 * @author wmtiger
	 */
	public class TextureAsset implements IAssets 
	{
		[Embed(source = "TextureAssets.png")]
		private const assetsPNG:Class;
		private var _assets:Bitmap;
		
		[Embed(source = "TextureAssets.xml", mimeType = "application/octet-stream")]
		private const assetsXML:Class;
		private var _xml:XML;
		
		private var _table:HashTable;
		private var _rect:Rectangle;
		private var _point:Point;
		
		public function TextureAsset() 
		{
			_rect = new Rectangle();
			_point = new Point();
			_table = new HashTable();
			_assets = new assetsPNG();
			_xml = new XML(new assetsXML());
			
			var xl:XMLList = _xml.SubTexture as XMLList;
			var str:String = "";
			var data:Texture;
			for (var i:String in xl) 
			{
				data = new Texture();
				str = xl[i].@name;
				data.name = str;
				data.x = int(xl[i].@x);
				data.y = int(xl[i].@y);
				data.width = int(xl[i].@width);
				data.height = int(xl[i].@height);
				
				_table.add(str, data);
			}
		}
		
		/* INTERFACE com.wm.base.IAssets */
		
		public function getSkin(key:String):BitmapData 
		{
			var bmd:BitmapData
			var data:Texture = _table.getValue(key) as Texture;
			if (data) 
			{
				bmd = new BitmapData(data.width, data.height, true, 0);
				_rect.width = data.width;
				_rect.height = data.height;
				_rect.x = data.x;
				_rect.y = data.y;
				bmd.copyPixels(_assets.bitmapData, _rect, _point);
			}
			return bmd;
		}
		
	}

}

class Texture
{
	public var name:String;
	public var x:int;
	public var y:int;
	public var width:int;
	public var height:int;
	
	public function Texture()
	{
		
	}
}