package com.wm.assets 
{
	import com.wm.utils.HashTable;
	/**
	 * 皮肤资源
	 * @author wmTiger
	 */
	public class Assets 
	{
		[Embed(source = "assets.swf", symbol = "btn_normal_1")]
		private const btn_normal_1:Class;
		
		[Embed(source = "assets.swf", symbol = "btn_normal_close_1")]
		private const btn_normal_close_1:Class;
		
		[Embed(source = "assets.swf", symbol = "btn_normal_max_1")]
		private const btn_normal_max_1:Class;
		
		[Embed(source = "assets.swf", symbol = "btn_normal_min_1")]
		private const btn_normal_min_1:Class;
		
		[Embed(source = "assets.swf", symbol = "window_1")]
		private const window_1:Class;
		
		private static var _instance:Assets;
		
		private var _table:HashTable;
		
		public function Assets() 
		{
			_table = new HashTable();
		}
		
		static public function get instance():Assets 
		{
			if (_instance == null) 
			{
				_instance = new Assets();
			}
			return _instance;
		}
		
		/**
		 * 获取皮肤，返回DisplayObject,自己注意好fla里面资源的类型定义
		 * @param	skin
		 * @return
		 */
		public function getSkin(skin:String):*
		{
			if (!_table.isHas(skin)) 
			{
				_table.add(skin, new (this[skin])());
			}
			return _table.getValue(skin);
		}
		
	}

}