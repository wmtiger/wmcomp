package com.wm.mgr 
{
	import com.wm.base.IAssets;
	import com.wm.utils.HashTable;
	import flash.display.BitmapData;
	/**
	 * 组件的资源管理器
	 * @author wmTiger
	 */
	public class AssetsMgr 
	{
		private static var _instance:AssetsMgr;
		
		private var _table:HashTable;//具体皮肤的集合(Embed进来的bitmap)
		private var _assetsTable:HashTable;//皮肤资源引用的集合(Embed进来的bitmap,具体的k/v对，也是bitmap的)
		
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
		
		/**
		 * 添加新的资源引用
		 * @param	name
		 * @param	assets
		 */
		public function addAsset(name:String, assets:IAssets):void
		{
			_assetsTable.add(name, assets);
		}
		
		/**
		 * 获取资源引用
		 * @param	name
		 * @return
		 */
		public function getAsset(name:String):IAssets
		{
			return _assetsTable.getValue(name);
		}
		
		/**
		 * 往素材集合中添加素材
		 * @param	key
		 * @param	skin
		 */
		public function addSkin(key:String, skin:*):void
		{
			_table.add(key, skin);
		}
		
		/**
		 * 取得集合中的素材
		 * @param	key
		 * @return
		 */
		public function getSkin(key:String):*
		{
			return _table.getValue(key);
		}
		
		/**
		 * 通过具体类型获取单个具体皮肤，返回Bitmap,自己注意好fla里面资源的类型定义
		 * @param	name		定义的皮肤名
		 * @param	style		style名
		 * @param	type		style类型:over, down, normal, focusIn 中的一个
		 * @return
		 */
		public function getSkinByAssetName(name:String, style:String, type:String = "normal"):BitmapData
		{
			var key:String = style + "_" + type;
			var skin:BitmapData;
			if (!_table.isHas(key)) 
			{
				var asset:IAssets = getAsset(name);
				if (asset) 
				{
					skin = asset.getSkin(key);
					if (skin) 
					{
						addSkin(key, skin);
					}
				}
			}
			else 
			{
				skin = getSkin(key) as BitmapData;
			}
			return skin;
		}
		
	}

}