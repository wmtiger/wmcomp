package com.wm.comp 
{
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	/**
	 * 带背景单行输入框
	 * @author wmTiger
	 */
	public class WmTextInput extends WmComp 
	{
		protected var _input:WmInput;
		private var _inputFocusIn:Boolean;
		protected var _itemX:int;
		protected var _itemY:int;
		
		public function WmTextInput(w:int = 120, h:int = 24) 
		{
			super(w, h);
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			setWH(w, h, true);
			init();
		}
		
		protected function initInfo():void
		{
			_itemX = 2;
			_itemY = 2;
			style = "def_txt";
		}
		
		protected function init():void 
		{
			initInfo();
			_input = new WmInput();
			addChild(_input);
			_input.x = _itemX;
			_input.y = _itemY;
			flushInputWidth();
		}
		
		override protected function initEvt():void 
		{
			//去掉原始监听
			_evtUtil.addEventListener(_input, FocusEvent.FOCUS_IN, onTxtFocusIn);
			_evtUtil.addEventListener(_input, FocusEvent.FOCUS_OUT, onTxtFocusOut);
			_evtUtil.addEventListener(_input, MouseEvent.MOUSE_OVER, onMOver);
			_evtUtil.addEventListener(_input, MouseEvent.MOUSE_OUT, onMOut);
		}
		
		private function onTxtFocusOut(e:FocusEvent):void 
		{
			_inputFocusIn = false;
			setCrtBgBmd("normal");
		}
		
		private function onMOut(e:MouseEvent):void 
		{
			if (!_inputFocusIn) 
			{
				setCrtBgBmd("normal");
			}
		}
		
		private function onMOver(e:MouseEvent):void 
		{
			if (!_inputFocusIn) 
			{
				setCrtBgBmd("over");
			}
		}
		
		private function onTxtFocusIn(e:FocusEvent):void 
		{
			_inputFocusIn = true;
			setCrtBgBmd("focusIn");
		}
		
		private function flushInputWidth():void
		{
			_input.width = compWidth - _itemX - _input.x;
		}
		
		override protected function getBgBmd(bmp:BitmapData):BitmapData 
		{
			if (chkBgBmd(bmp)) 
			{
				return bmp.clone();
			}
			return BitmapDataUtil.getBitmapData9Grid(bmp, compWidth, compHeight, 5, 5, 5, 5);
		}
		
		//是否多行文本，提供TextArea使用
		protected function setMultiline(val:Boolean):void
		{
			_input.multiline = val;
			_input.wordWrap = val;
		}
		
		public function setTxtFormat(obj:Object):void
		{
			_input.setFormat(obj);
		}
		
		public function set size(val:Object):void
		{
			_input.setFormat( { "size":int(val) } );
			if (!_input.multiline) 
			{
				//当为单行输入文本时，更改高度
				compHeight = _input.height + 4;
			}
		}
		
		public function set text(val:String):void
		{
			_input.text = val;
		}
		
		public function get text():String
		{
			return _input.text;
		}
		
		override public function set compWidth(value:int):void 
		{
			super.compWidth = value;
			flushInputWidth();
		}
		
		override public function dispose():void 
		{
			if (_input) 
			{
				_input.dispose();
				_input = null;
			}
			super.dispose();
		}
		
	}

}