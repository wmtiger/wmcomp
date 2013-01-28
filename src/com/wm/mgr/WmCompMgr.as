package com.wm.mgr 
{
	import com.wm.base.IAssets;
	import flash.display.Stage;
	/**
	 * 组件使用方法
	 * WmCompMgr.instance.init(stage);//初始化stage
	 * WmCompMgr.instance.addAsset("def", Assets);//初始化皮肤引用
	 * @author wmTiger
	 */
	public class WmCompMgr 
	{
		private static var _instance:WmCompMgr;
		private var _stage:Stage;
		
		public function WmCompMgr() 
		{
			
		}
		
		static public function get instance():WmCompMgr 
		{
			if (_instance == null) 
			{
				_instance = new WmCompMgr();
			}
			return _instance;
		}
		
		/**
		 * 初始化组件
		 * @param	stage
		 */
		public function init(stage:Stage):void
		{
			_stage = stage;
		}
		
		public function getStage():Stage
		{
			return _stage;
		}
		
		public function addAsset(name:String, assets:IAssets):void
		{
			AssetsMgr.instance.addAsset(name, assets);
		}
		
	}

}