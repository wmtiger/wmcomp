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
		
		/**
		 * 修改滚动条位置
		 * @param	p	为right是在右边，为left是在左边
		 */
		function setScrollPosition(p:String = "right"):void;
		
		/**
		 * 判断滚动条是否显示
		 */
		function chkScrollVisible():void;
	}
	
}