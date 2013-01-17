package test 
{
	import adobe.utils.CustomActions;
	import com.wm.base.ISprContent;
	import com.wm.comp.WmBackGround;
	import com.wm.comp.WmList;
	import com.wm.comp.WmPanel;
	import com.wm.comp.WmRadioBtn;
	import com.wm.comp.WmChkBox;
	import com.wm.comp.WmLabelBtn;
	import com.wm.comp.WmRadioGroup;
	import com.wm.comp.WmSlider;
	import com.wm.comp.WmSprite;
	import com.wm.comp.WmTab;
	import com.wm.comp.WmTextArea;
	import com.wm.comp.WmTextInput;
	import com.wm.comp.WmWnd;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class TestWnd extends WmWnd 
	{
		private var _okBtn:WmLabelBtn;
		private var _ta:WmTextArea;
		private var _ti:WmTextInput;
		private var _chk:WmChkBox;
		private var _chk2:WmChkBox;
		private var _radio:WmRadioBtn;
		private var _slider:WmSlider;
		private var _radio2:WmRadioBtn;
		private var _radioGroup:WmRadioGroup;
		
		public function TestWnd(title:String = "测试", w:int = 480, h:int = 300) 
		{
			super(title, w, h);
			
		}
		
		override protected function initWnd():void 
		{
			super.initWnd();
			
			_okBtn = new WmLabelBtn("确定");
			addElementToContent(_okBtn);
			_okBtn.right = 10;
			_okBtn.bottom = 120;
			_okBtn.clickHandler = function ():void 
			{
				var arr2:Array = getTestArr(20);
				list.data = arr2;
				_ta.text = "" + list.listNums;
			}
			
			_ta = new WmTextArea(200);
			addElementToContent(_ta);
			_ta.editable = true;
			
			_ti = new WmTextInput();
			addElementToContent(_ti);
			_ti.right = 0;
			
			_chk = new WmChkBox();
			addElementToContent(_chk);
			_chk.bottom = 0;
			_chk.label = "点一下";
			//_chk.enabled = false;
			_chk.autoWidth = true;
			
			_chk2 = new WmChkBox();
			addElementToContent(_chk2);
			_chk2.left = 100;
			_chk2.bottom = 0;
			_chk2.label = "点两下";
			_chk2.autoWidth = true;
			
			_radioGroup = new WmRadioGroup();
			
			_radio = new WmRadioBtn();
			addElementToContent(_radio);
			_radio.left = 200;
			_radio.bottom = 0;
			_radio.group = _radioGroup;
			
			_radio2 = new WmRadioBtn("测试2");
			addElementToContent(_radio2);
			_radio2.left = 300;
			_radio2.bottom = 0;
			_radio2.group = _radioGroup;
			
			_slider = new WmSlider(100);
			addElementToContent(_slider);
			_slider.bottom = 50;
			
			var list:WmList = new WmList();
			addElementToContent(list);
			var arr:Array = getTestArr(20);
			list.data = arr;
			list.right = 10;
			list.bottom = 10;
			
			var tabBar:WmSprite = new WmSprite();
			var tabContent1:WmPanel = new WmPanel(240, 180);
			var tabContent2:WmPanel = new WmPanel(240, 180);
			var tabContent3:WmPanel = new WmPanel(240, 180);
			tabContent1.visible = tabContent2.visible = tabContent3.visible = false;
			var tab:WmTab = new WmTab(tabBar);
			tab.tabs = [ { id:0, name:"标签0", w:59, h:22, content:tabContent1 },
						{ id:1, name:"标签1", w:59, h:22, content:tabContent2 },
						{ id:2, name:"标签2", w:59, h:22, content:tabContent3 } ];
			addElementToContent(tabContent1, 10, 171);
			addElementToContent(tabContent2, 10, 171);
			addElementToContent(tabContent3, 10, 171);
			addElementToContent(tabBar, 10, 150);
			
			var txtArea:WmTextArea = new WmTextArea();
			tabContent1.addElement(txtArea, 5, 5);
			txtArea.editable = true;
			
			var sendBtn:WmLabelBtn = new WmLabelBtn("发送");
			tabContent1.addElement(sendBtn, 130, 5);
			
		}
		
		private function getTestArr(n:int = 10):Array
		{
			var arr:Array = [];
			var l:int = int(Math.random() * n + 1);
			for (var i:int = 0; i < l; i++) 
			{
				arr.push( { id:i, name:"测试" + i } );
			}
			return arr;
		}
		
	}

}