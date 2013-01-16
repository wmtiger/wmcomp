package com.wm.evt 
{
	import flash.events.Event;
	
	/**
	 * 组件事件
	 * @author wmTiger
	 */
	public class WmCompEvt extends Event 
	{
		/**
		 * 更换对象
		 */
		public static const CHANGE:String = "change";
		
		private var _data:Object;
		
		public function WmCompEvt(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			_data = data;
			super(type, bubbles, cancelable);
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
		public function set data(value:Object):void 
		{
			_data = value;
		}
		
	}

}