package com.wm.base 
{
	
	/**
	 * ...
	 * @author wmTiger
	 */
	public interface IScroll 
	{
		/**
		 * 单纯的向上滚动
		 * unit	是滚动的单位，默认为1
		 */
		function scrollUp(unit:int = 1):void;
		
		/**
		 * 单纯的向下滚动
		 * unit	是滚动的单位，默认为1
		 */
		function scrollDown(unit:int = 1):void;
		
		/**
		 * 按百分比位置滚动
		 * @param	p
		 */
		function scrollPosition(p:Number):void;
	}
	
}