package com.wm.test 
{
	import com.wm.comp.WmLabelBtn;
	import com.wm.comp.WmRadioGroup;
	import com.wm.test.YTextInput;
	/**
	 * ...
	 * @author wmtiger
	 */
	public class TestYtjhWnd extends YtjhWnd 
	{
		private var _okBtn:WmLabelBtn;
		private var _chk:YtjhChkBox;
		private var _chk2:YtjhChkBox;
		private var _radio:YtjhRadioBtn;
		private var _radio2:YtjhRadioBtn;
		private var _radioGroup:WmRadioGroup;
		
		public function TestYtjhWnd(title:String="测试窗口", w:int=480, h:int=360) 
		{
			super(title, w, h);
			
		}
		
		override protected function initWnd():void 
		{
			super.initWnd();
			
			_okBtn = new WmLabelBtn("确定", 70, 23);
			_okBtn.style = "ytjh_btn";
			addElementToContent(_okBtn);
			_okBtn.right = 0;
			_okBtn.bottom = 0;
			
			_chk = new YtjhChkBox("多选1");
			addElementToContent(_chk);
			
			_chk2 = new YtjhChkBox("多选1");
			addElementToContent(_chk2);
			_chk2.top = 25;
			
			_radioGroup = new WmRadioGroup();
			
			_radio = new YtjhRadioBtn("单选1");
			_radio.group = _radioGroup;
			addElementToContent(_radio);
			_radio.left = 100;
			
			_radio2 = new YtjhRadioBtn("单选1");
			_radio2.group = _radioGroup;
			addElementToContent(_radio2);
			_radio2.left = 100;
			_radio2.top = 25;
			
			var txtInput:YTextInput = new YTextInput();
			addElementToContent(txtInput);
			txtInput.setTxtFormat({"color":0xffffff});
			txtInput.left = 10;
			txtInput.top = 100;
		}
		
	}

}