package com.wm.comp 
{
	import com.wm.base.IScroll;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * 带背景多行文本
	 * eg:
	 * _ta = new WmTextArea(200);
	 * addElementToContent(_ta);
	 * _ta.editable = true;
	 * @author wmtiger
	 */
	public class WmTextArea extends WmTextInput implements IScroll
	{
		private var _editable:Boolean;
		private var _selectable:Boolean;
		protected var _scrollPosition:String;//滚动条位置
		protected var _scroll:WmScroll;//滚动条
		
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
			
			_input.addEventListener(Event.CHANGE, onChange);
			_input.addEventListener(Event.SCROLL, onTextScroll);
			initScroll();
			setScrollPosition();
		}
		
		private function onTextScroll(e:Event):void 
		{
			flushScrollSliderY();
		}
		
		private function onChange(e:Event):void 
		{
			chkScrollVisible();
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
		
		public function appendText(txt:String):void
		{
			if (_input.text == "") 
			{
				this.text = txt;
			}
			else
			{
				this.text = (this.text + "\n" + txt);
			}
		}
		
		/* INTERFACE com.wm.base.IScroll */
		
		public function scrollUp(unit:int = 1):void 
		{
			_input.scrollV -= unit;
			flushScrollSliderY();
		}
		
		public function scrollDown(unit:int = 1):void 
		{
			_input.scrollV += unit;
			flushScrollSliderY();
		}
		
		private function flushScrollSliderY():void
		{
			_scroll.flushSliderBtnY((_input.scrollV - 1) / (_input.maxScrollV - 1));
		}
		
		public function scrollPosition(p:Number):void 
		{
			if (p == 1) 
			{
				_input.scrollV = _input.maxScrollV;
				return;
			}
			_input.scrollV = int(_input.maxScrollV * p);
		}
		
		public function chkScrollVisible():void 
		{
			trace(_input.scrollV, _input.maxScrollV, _input.numLines)
			if (_input.maxScrollV > 1) 
			{
				initScroll();
				_scroll.flushSliderHeight((_input.numLines - _input.maxScrollV) / _input.numLines);
				_scroll.visible = true;
				flushScrollPosition();
			}
			else
			{
				if (_scroll) 
					_scroll.visible = false;
			}
		}
		
		public function setScrollPosition(p:String = "right"):void 
		{
			_scrollPosition = p;
			flushScrollPosition();
		}
		
		//刷新滚动条所在的位置以及文本的相对位置
		protected function flushScrollPosition():void
		{
			if (_scrollPosition == "left") 
			{
				if (_scroll) 
				{
					_scroll.left = _itemX;
					if (_scroll.visible) 
					{
						_input.x = _itemX + _scroll.sprWidth;
						this.compWidth = compWidth;//刷新 _input 的width
					}
					else
					{
						_input.x = _itemX;
					}
				}
			}
			else if (_scrollPosition == "right") 
			{
				if (_scroll) 
				{
					_scroll.right = _itemX;
					_input.x = _itemX;
					if (_scroll.visible) 
					{
						_input.width = compWidth - _itemX - int(_scroll.right) - _scroll.sprWidth;
					}
					else
					{
						_input.width = compWidth - _itemX - int(_scroll.right);
					}
					
				}
			}
		}
		
		protected function initScroll():void
		{
			if (_scroll == null) 
			{
				_scroll = new WmScroll(this, 17, compHeight - _itemY * 2);
				addChild(_scroll);
				
				_scroll.top = _itemY;
				_scroll.visible = false;
			}
		}
		
		override public function dispose():void 
		{
			_input.removeEventListener(Event.CHANGE, onChange);
			_input.removeEventListener(Event.SCROLL, onTextScroll);
			if (_scroll) 
			{
				_scroll.dispose();
				_scroll = null;
			}
			_scrollPosition = null;
			super.dispose();
		}
		
	}

}