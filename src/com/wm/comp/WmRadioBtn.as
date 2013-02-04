package com.wm.comp 
{
	import flash.events.MouseEvent;
	/**
	 * 单选框-单行
	 * eg:
	 * _radioGroup = new WmRadioGroup();
	 * 
	 * _radio = new WmRadioBtn();
	 * 	addElementToContent(_radio);
	 * 	_radio.left = 200;
 	 * 	_radio.bottom = 0;
 	 * 	_radio.group = _radioGroup;
 	 * 	
 	 * 	_radio2 = new WmRadioBtn("测试2");
 	 * 	addElementToContent(_radio2);
 	 * 	_radio2.left = 300;
 	 * 	_radio2.bottom = 0;
 	 * 	_radio2.group = _radioGroup;
	 * @author wmtiger
	 */
	public class WmRadioBtn extends WmChkBox 
	{
		private var _group:WmRadioGroup;
		
		public function WmRadioBtn(label:String = "单选框", w:int = 80, h:int = 22) 
		{
			super(label, w, h);
			
		}
		
		override protected function initStyle():void 
		{
			style = "def_radiobtn";
		}
		
		override protected function setSelectedStyle(val:Boolean):void 
		{
			style = val ? "def_radiobtn_selected" : "def_radiobtn";
		}
		
		override protected function onCompClick(e:MouseEvent):void 
		{
			if (!selected) 
			{
				_group.clearAllRadioSelect();
				selected = true;
				setCrtBgBmd("over");
			}
		}
		
		public function set group(g:WmRadioGroup):void
		{
			_group = g;
			
			_group.add(label + this.name, this);
		}
		
		override public function dispose():void 
		{
			super.dispose();
			_group = null;
		}
		
	}

}