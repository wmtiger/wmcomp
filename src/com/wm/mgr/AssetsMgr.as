package com.wm.mgr 
{
	import com.wm.utils.HashTable;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author wmTiger
	 */
	public class AssetsMgr 
	{
		private static var _instance:AssetsMgr;
		
		private var _table:HashTable;
		private var _assetsTable:HashTable;
		
		public function AssetsMgr() 
		{
			_table = new HashTable();
			_assetsTable = new HashTable();
		}
		
		static public function get instance():AssetsMgr 
		{
			if (_instance == null) 
			{
				_instance = new AssetsMgr();
			}
			return _instance;
		}
		
		public function addAsset(name:String, assets:IAssets):void
		{
			
		}
		
		/**
		 * 这里的皮肤只支持位图
		 * @param	key
		 * @param	skin
		 */
		public function addSkin(key:String, skin:Bitmap):void
		{
			_table.add(key, skin);
		}
		
		/**
		 * 通过具体类型获取单个具体皮肤，返回DisplayObject,自己注意好fla里面资源的类型定义
		 * @param	style		style名
		 * @param	type		style类型:over, down, normal, focusIn 中的一个
		 * @return
		 */
		public function getSkinByType(style:String, type:String = "normal"):*
		{
			var key:String = style + "_" + type;
			return _table.getValue(key);
		}
		
	}

}