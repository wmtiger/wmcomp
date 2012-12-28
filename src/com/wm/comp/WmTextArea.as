package com.wm.comp 
{
	/**
	 * 带背景多行文本
	 * @author wmtiger
	 */
	public class WmTextArea extends WmTextInput 
	{
		private var _editable:Boolean;
		private var _selectable:Boolean;
		
		public function WmTextArea(w:int = 120, h:int = 120) 
		{
			super(w, h);
		}
		
		override protected function init():void 
		{
			super.init();
			multiline = true;//默认为多行
			editable = false;//默认不可编辑
			selectable = true;//默认可选择
			_input.autoTextHeight = false;//设置不自动刷新高
			_input.text = "";
			flushInputHeight();
		}
		
		public function set multiline(val:Boolean):void
		{
			setMultiline(val);
		}
		
		private function flushInputHeight():void
		{
			_input.height = compHeight - _input.y * 2;
		}
		
		override public function set compHeight(value:int):void 
		{
			super.compHeight = value;
			flushInputHeight();
		}
		
		public function get editable():Boolean 
		{
			return _editable;
		}
		
		public function set editable(value:Boolean):void 
		{
			_editable = value;
			_editable ? _input.type = "input" : _input.type = "dynamic";
			_editable ? _input.def = "在此输入" : null;
		}
		
		public function get selectable():Boolean 
		{
			return _selectable;
		}
		
		public function set selectable(value:Boolean):void 
		{
			_selectable = value;
			_input.selectable = _selectable;
		}
		
	}

}