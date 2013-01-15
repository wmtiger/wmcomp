package com.wm.base 
{
	import flash.display.DisplayObject;
	
	/**
	 * 自定义的容器接口
	 * @author wmtiger
	 */
	public interface ISprContent extends IDispose
	{
		/**
		 * 将一个 DisplayObject 子实例添加到该 DisplayObjectContainer 实例中。
		 * @param	disp
		 */
		function addElement(disp:DisplayObject, x:int = 0, y:int = 0):DisplayObject;
		/**
		 * 将一个 DisplayObject 子实例添加到该 DisplayObjectContainer 实例中。
		 * @param	disp
		 */
		function addElementAt(disp:DisplayObject, index:int, x:int = 0, y:int = 0):DisplayObject;
		/**
		 * 确定指定显示对象是 DisplayObjectContainer 实例的子项还是该实例本身。
		 * @param	disp
		 */
		function contains(child:DisplayObject):Boolean
		/**
		 * 从 DisplayObjectContainer 实例的子列表中删除指定的 child DisplayObject 实例。
		 * @param	disp
		 * @return
		 */
		function removeElement(disp:DisplayObject):DisplayObject;
		/**
		 * 从 DisplayObjectContainer 的子列表中指定的 index 位置删除子 DisplayObject。
		 * @param	index
		 * @return
		 */
		function removeElementAt(index:int):DisplayObject;
		/**
		 * 从 DisplayObjectContainer 实例中删除一个或多个子 DisplayObject 实例。
		 */
		function removeElements(beginIdx:int = 0, endIdx:int = int.MAX_VALUE):void;
		/**
		 * 返回具有指定名称的子显示对象。
		 * @param	disp
		 */
		function getElementByName(name:String):DisplayObject;
		/**
		 * 返回位于指定索引处的子显示对象实例。
		 * @param	disp
		 */
		function getElementAt(index:int):DisplayObject;
		/**
		 * 返回 DisplayObject 的 child 实例的索引位置。
		 * @param	disp
		 * @return
		 */
		function getElementIndex(disp:DisplayObject):int;
		/**
		 * 更改现有子项在显示对象容器中的位置。
		 * @param	disp
		 * @param	index
		 */
		function setElementIndex(disp:DisplayObject, index:int):void;
		/**
		 * 交换两个指定子对象的 Z 轴顺序（从前到后顺序）。
		 * @param	disp1
		 * @param	disp2
		 */
		function swapElement(disp1:DisplayObject, disp2:DisplayObject):void;
		/**
		 * 交换两个指定子对象的 Z 轴顺序（从前到后顺序）。
		 * @param	index1
		 * @param	index2
		 */
		function swapElementAt(index1:int, index2:int):void;
		
		function set visible(val:Boolean):void;
		function get visible():Boolean;
		
	}
	
}