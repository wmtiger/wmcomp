package com.wm.base 
{
	
	/**
	 * 组件位置
	 * @author wmTiger
	 */
	public interface IPosition 
	{
		function set left(val:Object):void;
		function set right(val:Object):void;
		function set top(val:Object):void;
		function set bottom(val:Object):void;
		
		function get left():Object;
		function get right():Object;
		function get top():Object;
		function get bottom():Object;
	}
	
}