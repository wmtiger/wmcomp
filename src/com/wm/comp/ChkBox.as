package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.utils.HashTable;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	/**
	 * 多选框-单行
	 * @author wmTiger
	 */
	public class ChkBox extends WmComp 
	{
		private var _txt:WmText;
		private var _label:String;
		private var _bmp:Bitmap;//具体的chkbox显示
		private var _bmdList:HashTable;
		private var _selected:Boolean;//是否被选中
		
		public function ChkBox(label:String = "单选框", w:int = 80, h:int = 22) 
		{
			_label = label;
			_bmdList = new HashTable();
			super(w, h);
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			setWH(w, h, true);
			_bmp = new Bitmap();
			addChild(_bmp);
			style = "chkbox_def";
			_txt = new WmText();
			addChild(_txt);
			
			label = _label;
			this.mouseChildren = false;
		}
		
		override protected function onCompClick(e:MouseEvent):void 
		{
			if (_selected) 
			{
				style = "chkbox_def";
				_selected = false;
			}
			else
			{
				style = "chkbox_def_selected";
				_selected = true;
			}
			setCrtBgBmd("over");
		}
		
		override public function set style(value:String):void 
		{
			_style = value;
			
			initChkBoxStyle();//设置过显示之后，重新刷新缓存列表
		}
		
		private function initChkBoxStyle():void 
		{
			//_bmdList.clear();//这里要注意，可能会有内存泄漏，要注意自定义数据以及位图数据的情况，后期再看。
			//将四种状态的位图都画好
			for (var i:int = 0; i < STYLE_LIST.length; i++) 
			{
				var bmp:Bitmap = Assets.instance.getSkinByType(style, STYLE_LIST[i]) as Bitmap;
				//此处不重复缓存位图，且此处位图不需要dispose，只需要设置为null即可，因为使用的数据是静态一份的
				if (!_bmdList.isHas(style + STYLE_LIST[i])) 
				{
					_bmdList.add(style + STYLE_LIST[i], bmp);
				}
			}
			
			setCrtBgBmd("normal");
		}
		
		//设置当前要显示的位图,type为:normal, over, down, focusIn
		override protected function setCrtBgBmd(type:String):void
		{
			var bmp:Bitmap = _bmdList.getValue(style + type);
			_bmp.bitmapData = bmp.bitmapData;
			
			_bmp.y = compHeight - _bmp.height >> 1;
		}
		
		override protected function drawBg():void 
		{
			drawGraphic();
		}
		
		public function get label():String 
		{
			return _label;
		}
		
		public function set label(value:String):void 
		{
			_label = value;
			
			_txt.text = _label;
			_txt.x = _bmp.x + _bmp.width + 5;
			_txt.width = compWidth - _txt.x;
			_txt.y = compHeight - _txt.height >> 1;
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}
		
		override public function dispose():void 
		{
			super.dispose();
			if (_bmdList) 
			{
				_bmdList.dispose();
				_bmdList = null;
			}
			_bmp = null;//此处不需要dispose，因为bmd是静态缓存的
			if (_txt) 
			{
				_txt.dispose();
				_txt = null;
			}
			_label = null;
		}
		
	}

}