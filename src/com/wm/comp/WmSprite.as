package com.wm.comp 
{
	import com.wm.base.IDispose;
	import com.wm.base.IPosition;
	import com.wm.base.ISprContent;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * 简单精灵、容器
	 * @author wmTiger
	 */
	public class WmSprite extends Sprite implements IDispose, IPosition, ISprContent
	{
		protected var _bgBmd:BitmapData;//底图的位图数据，实际显示用的是这个
		
		protected var _left:int;
		protected var _right:int;
		protected var _top:int;
		protected var _bottom:int;
		
		protected var _sprWidth:int;
		protected var _sprHeight:int;
		
		public function WmSprite() 
		{
			super();
		}
		
		public function setWH(w:int, h:int, draw:Boolean = false):void
		{
			_sprWidth = w;
			_sprHeight = h;
			if (_sprWidth == 0 || _sprHeight == 0) 
				return;
			if (!draw) 
				return;
			drawDefBg();
		}
		protected function drawDefBg():void
		{
			this.graphics.clear();
			this.graphics.beginFill(0, 0);
			this.graphics.drawRect(0, 0, _sprWidth, _sprHeight);
			this.graphics.endFill();
		}
		
		public function get sprWidth():int 
		{
			return _sprWidth;
		}
		
		public function get sprHeight():int 
		{
			return _sprHeight;
		}
		
		public function flushPosition():void
		{
			right = _right;
			left = _left;
			bottom = _bottom;
			top = _top;
		}
		
		/* INTERFACE com.wm.base.IPosition */
		
		public function set left(value:Object):void 
		{
			_left = int(value);
			if (this.parent) 
			{
				this.x = _left;
			}
		}
		
		public function set right(value:Object):void 
		{
			_right = int(value);
			if (this.parent) 
			{
				this.x = this.parent.width - this.width - _right;
			}
		}
		
		public function set top(value:Object):void 
		{
			_top = int(value);
			if (this.parent) 
			{
				this.y = _top;
			}
		}
		
		public function set bottom(value:Object):void 
		{
			_bottom = int(value);
			if (this.parent) 
			{
				this.y = this.parent.height - this.height - _bottom;
			}
		}
		
		public function get left():Object 
		{
			return Object(_left);
		}
		
		public function get right():Object 
		{
			return Object(_right);
		}
		
		public function get top():Object 
		{
			return Object(_top);
		}
		
		public function get bottom():Object 
		{
			return Object(_bottom);
		}
		
		/* INTERFACE wm.base.IDispose */
		
		public function dispose():void 
		{
			if (this.parent) 
			{
				this.parent.removeChild(this);
			}
			if (_bgBmd) 
			{
				_bgBmd.dispose();
				_bgBmd = null;
			}
		}
		
		/* INTERFACE com.wm.base.ISprContent */
		
		public function addElement(disp:DisplayObject, x:int = 0, y:int = 0):DisplayObject 
		{
			disp.x = x;
			disp.y = y;
			return addChild(disp);
		}
		
		public function addElementAt(disp:DisplayObject, index:int, x:int = 0, y:int = 0):DisplayObject 
		{
			disp.x = x;
			disp.y = y;
			return addChildAt(disp, index);
		}
		
		public function removeElement(disp:DisplayObject):DisplayObject 
		{
			return removeChild(disp);
		}
		
		public function removeElementAt(index:int):DisplayObject 
		{
			return removeChildAt(index);
		}
		
		public function removeElements(beginIdx:int = 0, endIdx:int = int.MAX_VALUE):void 
		{
			removeChildren(beginIdx, endIdx);
		}
		
		public function getElementByName(name:String):DisplayObject 
		{
			return getChildByName(name);
		}
		
		public function getElementAt(index:int):DisplayObject 
		{
			return getChildAt(index);
		}
		
		public function getElementIndex(disp:DisplayObject):int 
		{
			return getChildIndex(disp);
		}
		
		public function setElementIndex(disp:DisplayObject, index:int):void 
		{
			setChildIndex(disp, index);
		}
		
		public function swapElement(disp1:DisplayObject, disp2:DisplayObject):void 
		{
			swapChildren(disp1, disp2);
		}
		
		public function swapElementAt(index1:int, index2:int):void 
		{
			swapChildrenAt(index1, index2);
		}
		
	}

}