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
		
	}

}