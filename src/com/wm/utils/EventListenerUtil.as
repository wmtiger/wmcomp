package com.wm.utils 
{
	import flash.events.IEventDispatcher;
	/**
	 * 事件监听器
	 * @author Robin
	 */
	public class EventListenerUtil 
	{
		private var mListenerList:Vector.<EventModel> = new Vector.<EventModel>;
		public function EventListenerUtil() 
		{
			
		}
		
		/**
		 * 添加监听事件
		 * @param	target
		 * @param	eventType
		 * @param	listener
		 */
		public function addEventListener(target:IEventDispatcher, eventType:String, listener:Function):void
		{
			if (target&&listener&&eventType&&eventType.length>0)
			{
				var eventMode:EventModel = new EventModel(target, eventType, listener);
				target.addEventListener(eventType,listener)
				mListenerList.push(eventMode);
			}
		}
		
		/**
		 * 删除监听事件
		 * @param	target
		 * @param	eventType
		 * @param	listener
		 */
		public function removeEventListener(target:IEventDispatcher, eventType:String, listener:Function):void
		{
			for (var i:int = mListenerList.length-1; i >=0; i-- )
			{
				var item:EventModel = mListenerList[i];
				if (item)
				{
					if (item.target == target && item.eventType == eventType && item.listener == listener)
					{
						if (item.target)
						{
							item.target.removeEventListener(item.eventType, item.listener);
							mListenerList.splice(i, 1);
							//break;
						}
					}
				}
			}
		}
		
		/**
		 * 删除指定对象的所有监听事件
		 * @param	target
		 */
		public function removeTargetAllEventListener(target:IEventDispatcher):void
		{
			for (var i:int = mListenerList.length - 1; i >= 0; i-- )
			{
				var item:EventModel = mListenerList[i];
				if (item)
				{
					if (item.target == target)
					{
						if (item.target)
						{
							item.target.removeEventListener(item.eventType, item.listener);
						}
						mListenerList.splice(i, 1);
					}
				}
			}
		}
		
		/**
		 * 删除所有监听事件
		 */
		public function removeAllEventListener():void
		{
			if (mListenerList == null) 
			{
				return;
			}
			while (mListenerList.length > 0)
			{
				var item:EventModel = mListenerList.shift();
				if (item)
				{
					var target:IEventDispatcher = item.target;
					var eventType:String = item.eventType;
					var listener:Function = item.listener;
					target.removeEventListener(eventType, listener);
					item.dispose();
					item = null;
				}
			}
		}
		
		public function dispose():void
		{
			removeAllEventListener();
			mListenerList = null;
		}
	}
}
import flash.events.IEventDispatcher;

class EventModel {
	public var target:IEventDispatcher;
	public var eventType:String;
	public var listener:Function;
	
	public function EventModel(_target:IEventDispatcher, _eventType:String, _listener:Function) {
		target = _target;
		eventType = _eventType;
		listener = _listener;
	}
	
	public function dispose():void
	{
		target = null;
		eventType = null;
		listener = null;
	}
}