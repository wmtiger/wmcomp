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
	public class WmChkBox extends WmComp 
	{
		private var _txt:WmText;
		private var _label:String;
		private var _bmp:Bitmap;//具体的chkbox显示
		private var _bmdList:HashTable;
		private var _selected:Boolean;//是否被选中
		private var _autoWidth:Boolean;//是否自动根据字宽来设置宽度
		
		public function WmChkBox(label:String = "多选框", w:int = 80, h:int = 22) 
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
			initStyle();
			_txt = new WmText();
			addChild(_txt);
			_txt.x = _bmp.x + _bmp.width + 5;
			_txt.selectable = false;
			_autoWidth = false;//默认不自动根据字宽来设置组件宽度
			label = _label;
			this.mouseChildren = false;
		}
		
		protected function initStyle():void
		{
			style = "chkbox_def";
		}
		
		protected function setSelectedStyle(val:Boolean):void
		{
			style = val ? "chkbox_def_selected" : "chkbox_def";
		}
		
		override protected function onCompClick(e:MouseEvent):void 
		{
			selected = !selected;
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
		
		override protected function drawGraphic(bmd:BitmapData = null, type:String = "normal"):void
		{
			this.graphics.clear();
			if (bmd) 
			{
				this.graphics.beginBitmapFill(bmd, null, false);
			}
			else
			{
				if (compWidth == 0 || compHeight == 0) 
				{
					return;
				}
				this.graphics.beginFill(0x0000cc, 0);
			}
			this.graphics.drawRect(0, 0, compWidth, compHeight);
			this.graphics.endFill();
		}
		
		public function get label():String 
		{
			return _label;
		}
		
		public function set label(value:String):void 
		{
			_label = value;
			
			//_txt.text = "";//此处如果要重新覆盖文本，就要将其先设置为"",然后再修改文本，这样字体就能生效
			_txt.text = _label;
			flushWidth();
			_txt.y = compHeight - _txt.height >> 1;
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}
		
		public function set selected(val:Boolean):void
		{
			_selected = val;
			
			setSelectedStyle(val);
		}
		
		/**
		 * 设置文本格式
		 * @param	fmtObject	格式如下:{ "size":14, "font":"SimSun" }
		 */
		public function setLabelFormat(fmtObject:Object):void
		{
			_txt.setFormat(fmtObject);
		}
		
		public function get autoWidth():Boolean 
		{
			return _autoWidth;
		}
		
		public function set autoWidth(value:Boolean):void 
		{
			_autoWidth = value;
			_txt.autoTextWidth = _autoWidth;
			
			label = _label;
		}
		
		protected function flushWidth():void
		{
			if (_autoWidth) 
			{
				compWidth = _txt.x + _txt.width;
			}
			else
			{
				_txt.width = compWidth - _txt.x;
			}
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