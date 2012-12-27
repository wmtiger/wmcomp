package com.wm.utils 
{
	import flash.utils.Dictionary;
	/**
	 * 哈希表
	 * @author wmtiger
	 */
	public class HashTable 
	{
		private var keys:Array;
		private var values:Array;
		private var dict:Dictionary;
		private var _removeValue:Object;
		
		public function HashTable() 
		{
			init();
		}
		
		private function init():void
		{
			keys = [];
			values = [];
			dict = new Dictionary(true);
		}
		
		/**
		 * 添加新项 
		 * @param name 键名
		 * @param value 数据
		 */
		public function add(name:String, value:Object):void
		{
			var key:String = name + "";
			if(!isHas(key))
			{
				/*如果此数据没有，则添加*/
				keys.push(key);
				values.push(value);
			}
			else
			{
				/*如果此数据已经存在，则刷新*/
				var index:int = keys.indexOf(key);
				if(index == -1) return;
				values[index] = value;
			}
			dict[key] = value;
		}
		
		/**
		 * 获得项 
		 * @param name 键名
		 */
		public function getValue(name:String):*
		{
			var key:String = name + "";
			if (isHas(key))
			{
				return dict[name];
			}
			return null;
		}
		
		/**
		 * 按key移除数据 
		 * @param name
		 * @return 
		 */
		public function remove(name:String):void
		{
			var index:int = -1;
			index = typeof(name) == "number" ? keys.indexOf(name.toString()) : keys.indexOf(name);
			if(isHas(name))
			{
				keys.splice(index, 1);
				values.splice(index, 1);
				
				delete dict[name];
			}
		}
		
		/**
		 *　按 value　删除数据 
		 * @param value
		 * @return 
		 * 
		 */		
		public function remove_value(value:*):Boolean
		{
			_removeValue = value;
			values.forEach(removeByValue);
			return true;
		}
		
		private function removeByValue(element:*, index:int, arr:Array):Boolean
		{
			if(element == _removeValue)
			{
				if(isHas(keys[index]))
				{
					remove(keys[index]);
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 获取第一条数据 
		 * @return 
		 */
		public function getFirst():Object
		{
			return values.length > 0 ? values[0] : null;
		}
		
		/**
		 * 获取最后一条数据 
		 * @return 
		 */
		public function getLast():Object
		{
			return values[values.length - 1];
		}
		
		public function clone():HashTable
		{
			var list:HashTable = new HashTable();
			for each(var key:* in keys)
			{
				list[key] = dict[key];
			}
			return list;
		}
		
		/**
		 * 按值获取key 
		 * @param value
		 * @return 
		 */
		public function keyOf(value:Object):String
		{
			var index : int = values.indexOf(value);
			return index > -1 ? keys[index] : null;
		}
		
		/**
		 * 清空数据 
		 */		
		public function clear():void
		{
			while(keys.length > 0)
				keys.pop();
			keys = null;
			
			while(values.length > 0)
				values.pop();
			values = null;
			dict = null;
			
			init();
		}
		
		/**
		 * 获取键的数据副本
		 * @return
		 */
		public function getKeys():Array
		{
			//创建数组复本
			var clone:Array = keys.concat();
			return clone;
		}
		
		/**
		 * 获取副本数据 
		 * @return 
		 */
		public function getValues():Array
		{
			//创建数组复本
			var clone:Array = values.concat();
			return clone;
		}
		
		public function get count():Number
		{
			return values.length;
		}
		
		/**
		 * 按key验证数据是否存在 
		 * @param name
		 */		
		public function isHas(name:String):Boolean
		{
			return hasProperty(name);
		}
		
		public function setProperty(name:String, value:*):void
		{
			add(name, value);
		}
		
		protected function callProperty(name:String, ...parameters):*
		{
			return null;		
		}
		
		protected function getProperty(name:String):*
		{
			var key:String = name;
			
			var obj:Object = dict[key];
			if(obj)
			{
				var index:int = values.indexOf(obj);
				if(index > -1)
					return values[index];
			}
			return null;
		}
		protected function hasProperty(name:String):Boolean
		{
			return dict[name] != null;
		}
		protected function nextName(index:int):String
		{
			return keys[index - 1].toString();
		}
		// 在 for each 或 for in 中取得下一个索引值
		// 如果超过界限则返回零
		// index 会从零开始,但零表示结束,所以这里返回index+1
		// 而在 nextName 与 nextValue 方法中,使用index-1
		protected function nextNameIndex(index:int):int
		{
			return index < keys.length? index + 1 : 0;
		}
		protected function nextValue(index:int):*
		{
			return dict[keys[index - 1]];
		}
		
		public function dispose():void
		{
			keys = null;
			values = null;
			dict = null;
			
			_removeValue = null;
		}
	}

}