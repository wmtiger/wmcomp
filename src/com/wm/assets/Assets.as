package com.wm.assets 
{
	/**
	 * 皮肤资源
	 * @author wmTiger
	 */
	public class Assets 
	{
		private static var _instance:Assets;
		
		public function Assets() 
		{
			
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
		 * 获取皮肤，返回DisplayObject
		 * @param	skin
		 * @return
		 */
		public function getSkin(skin:String):*
		{
			return new (this[skin])();
		}
		
		/**
		 * 返回皮肤的类
		 * @param	skin
		 * @return
		 */
		public function getSkinClass(skin:String):Class
		{
			return this[skin];
		}
		
	}

}