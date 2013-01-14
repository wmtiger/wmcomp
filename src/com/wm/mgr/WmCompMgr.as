package com.wm.mgr 
{
	import flash.display.Stage;
	/**
	 * ...
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
		
		public function init(stage:Stage):void
		{
			_stage = stage;
		}
		
		public function getStage():Stage
		{
			return _stage;
		}
		
	}

}