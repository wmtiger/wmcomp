package com.wm.comp 
{
	import flash.events.MouseEvent;
	/**
	 * 单行输入框
	 * @author wmTiger
	 */
	public class WmInput extends WmText 
	{
		private var _def:String = "";
		
		public function WmInput(txt:String = "", x:int = 0, y:int = 0, w:int = 100, h:int = 22,
			font:String = null, size:Object = 14, color:Object = null, align:String = null, bold:Object = null) 
		{
			super(txt, x, y, w, h, font, size, color, align, bold);
			this.type = "input";
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownTxt);
		}
		
		private function onMouseDownTxt(e:MouseEvent):void 
		{
			if (this.text == _def) 
			{
				this.setSelection(0, _def.length);
			}
		}
		
		public function get def():String 
		{
			return _def;
		}
		
		public function set def(value:String):void 
		{
			_def = value;
		}
		
		override public function dispose():void 
		{
			_def = null;
			this.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDownTxt);
			super.dispose();
		}
		
	}

}