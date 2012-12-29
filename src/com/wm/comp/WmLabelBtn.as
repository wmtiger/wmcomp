package com.wm.comp 
{
	/**
	 * 带文本的按钮
	 * @author wmtiger
	 */
	public class WmLabelBtn extends WmBtn 
	{
		private var _label:WmText;
		private var _txt:String;
		
		public function WmLabelBtn(txt:String, w:int = 73, h:int = 19) 
		{
			_txt = txt;
			super(w, h);
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			super.initComp(w, h);
			
			_label = new WmText();
			//_label.setFormat( { "size":12 } );
			addChild(_label);
			_label.selectable = false;
			label = _txt;
		}
		
		public function get label():String
		{
			return _txt + "";
		}
		
		public function set label(txt:String):void
		{
			_txt = txt;
			
			_label.setText(txt, true, true);
			_label.x = compWidth - _label.width >> 1;
			_label.y = compHeight - _label.height >> 1;
		}
		
		override public function dispose():void 
		{
			_txt = null;
			if (_label) 
			{
				_label.dispose();
				_label = null;
			}
			super.dispose();
		}
		
	}

}