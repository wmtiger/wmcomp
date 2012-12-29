package com.wm.comp 
{
	import com.wm.utils.HashTable;
	/**
	 * 单选框组
	 * @author wmtiger
	 */
	public class WmRadioGroup 
	{
		private var _list:HashTable;
		
		public function WmRadioGroup() 
		{
			_list = new HashTable();
		}
		
		public function add(key:String, radio:WmRadioBtn):void
		{
			_list.add(key, radio);
		}
		
		public function clearAllRadioSelect():void
		{
			var arr:Array = _list.getValues();
			for (var i:int = 0; i < arr.length; i++) 
			{
				var radio:WmRadioBtn = arr[i] as WmRadioBtn;
				radio.selected = false;
			}
		}
		
		public function dispose():void
		{
			if (_list) 
			{
				_list.dispose();
				_list = null;
			}
		}
		
	}

}