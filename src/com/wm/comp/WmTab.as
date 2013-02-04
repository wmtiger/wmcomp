package com.wm.comp 
{
	import com.wm.base.IListItemRender;
	import com.wm.base.ISprContent;
	import com.wm.utils.EventListenerUtil;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * 标签
	 * eg:
	 * var tabBar:WmSprite = new WmSprite();
	 * var tabContent1:WmPanel = new WmPanel(240, 180);
	 * var tabContent2:WmPanel = new WmPanel(240, 180);
	 * var tabContent3:WmPanel = new WmPanel(240, 180);
	 * tabContent1.visible = tabContent2.visible = tabContent3.visible = false;
	 * var tab:WmTab = new WmTab(tabBar);
	 * tab.tabs = [ { id:0, name:"标签0", w:59, h:22, content:tabContent1 },
	 * 			{ id:1, name:"标签1", w:59, h:22, content:tabContent2 },
	 * 			{ id:2, name:"标签2", w:59, h:22, content:tabContent3 } ];
	 * addElementToContent(tabContent1, 10, 171);
	 * addElementToContent(tabContent2, 10, 171);
	 * addElementToContent(tabContent3, 10, 171);
	 * addElementToContent(tabBar, 10, 150);
	 * @author wmtiger
	 */
	public class WmTab 
	{
		private var _tabBar:ISprContent;//标签按钮显示列表
		private var _tabBtns:Array;//标签按钮列表
		private var _tabContents:Vector.<ISprContent>;//标签内容列表
		protected var _curSelectedItem:IListItemRender;
		protected var _evtUtil:EventListenerUtil;
		protected var _tabBtnWidth:int;
		protected var _tabBtnHeight:int;
		protected var _tabBtnGap:int;
		
		public function WmTab(tabBar:ISprContent)
		{
			_tabBar = tabBar;
			_tabContents = new Vector.<ISprContent>();
			_evtUtil = new EventListenerUtil();
			_tabBtns = [];
			tabBtnWidth = 59;
			tabBtnGap = 5;
			_evtUtil.addEventListener(WmSprite(_tabBar), MouseEvent.CLICK, onClickTabBar);
			
		}
		
		private function onClickTabBar(e:MouseEvent):void 
		{
			e.stopImmediatePropagation();
			if (e.target is IListItemRender) 
			{
				var item:IListItemRender = e.target as IListItemRender;
				/*if (item == _curSelectedItem) 
				{
					return;
				}*/
				
				var l:int = _tabBtns.length;
				for (var i:int = 0; i < l; i++) 
				{
					_tabBtns[i].selected = false;
					//_tabContents[i].visible = false;
				}
				item.selected = true;
				_curSelectedItem = item;
				
				//WmSprite(_tabBar).dispatchEvent(new Event(Event.CHANGE));//更换选中对象
			}
		}
		
		public function set tabs(arr:Array):void
		{
			var l:int = arr.length;
			for (var i:int = 0; i < l; i++) 
			{
				var obj:Object = arr[i];
				var btn:TabBtn = new TabBtn(obj.name + "", obj.w, obj.h);
				btn.style = "def_btn_tab";
				btn.selected = false;
				btn.content = obj.content;
				_tabBar.addElement(btn, i * (tabBtnWidth + tabBtnGap));
				_tabBtns.push(btn);
				_tabContents.push(obj.content);
			}
			
			initTab();
		}
		
		protected function initTab():void 
		{
			_tabBtns[0].selected = true;
		}
		
		public function get tabBtnWidth():int 
		{
			return _tabBtnWidth;
		}
		
		public function set tabBtnWidth(value:int):void 
		{
			_tabBtnWidth = value;
		}
		
		public function get tabBtnHeight():int 
		{
			return _tabBtnHeight;
		}
		
		public function set tabBtnHeight(value:int):void 
		{
			_tabBtnHeight = value;
		}
		
		public function get tabBtnGap():int 
		{
			return _tabBtnGap;
		}
		
		public function set tabBtnGap(value:int):void 
		{
			_tabBtnGap = value;
		}
		
		public function dispose():void
		{
			if (_evtUtil) 
			{
				_evtUtil.dispose();
				_evtUtil = null;
			}
			if (_tabBar) 
			{
				_tabBar.dispose();
				_tabBar = null;
			}
			if (_tabBtns) 
			{
				for (var i:int = 0; i < _tabBtns.length; i++) 
				{
					_tabBtns[i].dispose();
					_tabBtns[i] = null;
				}
				_tabBtns = null;
			}
			if (_tabContents) 
			{
				for (var j:int = 0; j < _tabContents.length; j++) 
				{
					_tabContents[j].dispose();
					_tabContents[j] = null;
				}
				_tabContents = null;
			}
			_curSelectedItem = null;
		}
		
	}

}
import com.wm.base.IListItemRender;
import com.wm.base.ISprContent;
import com.wm.comp.WmLabelBtn;
import flash.events.MouseEvent;

class TabBtn extends WmLabelBtn implements IListItemRender
{
	private var _selected:Boolean;
	private var _content:ISprContent;
	
	public function TabBtn(txt:String = "", w:int = 59, h:int = 22)
	{
		super(txt, w, h);
	}
	
	/* INTERFACE com.wm.base.IListItemRender */
	
	public function get data():Object 
	{
		return null;
	}
	
	public function set data(value:Object):void { }
	
	override protected function initComp(w:int, h:int):void 
	{
		setWH(w, h, true);
		style = "def_btn_tab";
		
		this.mouseChildren = false;
		this.buttonMode = false;
		initLabel();
	}

	override protected function onCompMDown(e:MouseEvent):void 
	{
		if (selected) 
		{
			return;
		}
		super.onCompMDown(e);
	}
	
	override protected function onCompMOut(e:MouseEvent):void 
	{
		if (selected) 
		{
			return;
		}
		super.onCompMOut(e);
	}
	
	override protected function onCompMOver(e:MouseEvent):void 
	{
		if (selected) 
		{
			return;
		}
		super.onCompMOver(e);
	}
	
	override protected function onCompMUp(e:MouseEvent):void 
	{
		if (selected) 
		{
			return;
		}
		super.onCompMUp(e);
	}
	
	public function get selected():Boolean 
	{
		return _selected;
	}
	
	public function set selected(value:Boolean):void 
	{
		if (selected == value) 
		{
			return;
		}
		_selected = value;
		
		if (_selected) 
		{
			setCrtBgBmd("down");
			_content.visible = true;
		}
		else
		{
			setCrtBgBmd("normal");
			_content.visible = false;
		}
	}
	
	public function set content(value:ISprContent):void 
	{
		_content = value;
	}
	
	override public function dispose():void 
	{
		_content = null;
		super.dispose();
	}
}