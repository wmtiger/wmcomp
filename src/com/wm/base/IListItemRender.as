package com.wm.base 
{
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public interface IListItemRender 
	{
		function get selected():Boolean;
		
		function set selected(value:Boolean):void;
		
		function get data():Object;
		
		function set data(value:Object):void;
	}
	
}