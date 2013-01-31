package com.wm.base 
{
	
	/**
	 * 物品格子接口
	 * @author wmtiger
	 */
	public interface IGrid 
	{
		function showTip():void;
		function hideTip():void;
		
		function clear():void;
		function applyData():void;
		
		function set gridId(val:String):void;
		function get gridId():String;
		
		function getWidth():int;
		function getHeight():int;
	}
	
}