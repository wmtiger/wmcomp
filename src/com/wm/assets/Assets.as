package com.wm.assets 
{
	import com.wm.utils.HashTable;
	/**
	 * 皮肤资源
	 * @author wmTiger
	 */
	public class Assets 
	{
		[Embed(source = "assets.swf", symbol = "btn_def_normal_1")]
		private const btn_def_normal_1:Class;
		
		[Embed(source = "assets.swf", symbol = "btn_close_normal_1")]
		private const btn_close_normal_1:Class;
		
		[Embed(source = "assets.swf", symbol = "btn_max_normal_1")]
		private const btn_max_normal_1:Class;
		
		[Embed(source = "assets.swf", symbol = "btn_min_normal_1")]
		private const btn_min_normal_1:Class;
		
		[Embed(source = "assets.swf", symbol = "window_def_1")]
		private const window_def_1:Class;
		
		[Embed(source = "assets.swf", symbol = "txt_input_normal_1")]
		private const txt_input_normal_1:Class;
		
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