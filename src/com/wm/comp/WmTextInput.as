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
		
		public function WmTextInput(w:int = 120, h:int = 24) 
		{
			super(w, h);
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			setWH(w, h, true);
			init();
		}
		
		protected function init():void 
		{
			_input = new WmInput();
			addChild(_input);
			_input.x = 2;
			_input.y = 2;
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
			_input.width = compWidth - _input.x * 2;
		}
		
		override protected function getBgBmd(bmp:Bitmap):BitmapData 
		{
			return BitmapDataUtil.getBitmapData9Grid(bmp.bitmapData, compWidth, compHeight, 5, 5, 5, 5);
		}
		
		//是否多行文本，提供TextArea使用
		protected function setMultiline(val:Boolean):void
		{
			_input.multiline = val;
			_input.wordWrap = val;
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