package com.wm.comp 
{
	import com.wm.base.IDispose;
	import com.wm.base.IPosition;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * 简单文本框
	 * @author wmTiger
	 */
	public class WmText extends TextField implements IDispose, IPosition
	{
		private var _fmt:TextFormat;
		private var _left:int;
		private var _right:int;
		private var _top:int;
		private var _bottom:int;
		
		public function WmText(txt:String = "", x:int = 0, y:int = 0, w:int = 100, h:int = 22,
				font:String = "SimSun", size:Object = 14, color:Object = null,
				align:String = null, bold:Object = null) 
		{
			super();
			_fmt = new TextFormat(font, size, color, bold, null, null, null, null, align);
			this.x = x;
			this.y = y;
			this.width = w;
			this.height = h;
			this.text = txt;
		}
		
		override public function set text(value:String):void
		{
			var b:Boolean = this.text == "" ? true : false;//之前文本框是否是空字符
			super.text = value;
			b ? setFormat(_fmt) : null;
		}
		
		/**
		* 在左对齐的情况下，设置是否自动计算宽高
		* @param     txt
		* @param     autoWidth
		* @param     autoHeight
		*/
		public function setText(txt:String, autoWidth:Boolean = false, autoHeight:Boolean = false):void
		{
			this.text = txt;
			if (autoWidth)
			{
				this.width = this.textWidth + 4;
			}
			if (autoHeight)
			{
				this.height = this.textHeight + 4;
			}
		}
		
		/**
		 * 设置文本格式
		 * @param	fmtObject	格式如下:{ "size":14, "font":"SimSun" }
		 */
		public function setFormat(fmtObject:Object):void
		{
			if (fmtObject is TextFormat)
			{
				this.setTextFormat(fmtObject as TextFormat);
				return;
			}
			if (fmtObject["font"])
				_fmt.font = fmtObject["font"];
			if (fmtObject["size"])
				_fmt.size = fmtObject["size"];
			if (fmtObject["color"])
				_fmt.color = fmtObject["color"];
			if (fmtObject["bold"])
				_fmt.bold = fmtObject["bold"];
			if (fmtObject["align"])
				_fmt.align = fmtObject["align"];
			if (fmtObject["italic"])
				_fmt.italic = fmtObject["italic"];
			if (fmtObject["underline"])
				_fmt.underline = fmtObject["underline"];
			if (fmtObject["url"])
				_fmt.url = fmtObject["url"];
			if (fmtObject["target"])
				_fmt.target = fmtObject["target"];
			if (fmtObject["leftMargin"])
				_fmt.leftMargin = fmtObject["leftMargin"];
			if (fmtObject["rightMargin"])
				_fmt.rightMargin = fmtObject["rightMargin"];
			if (fmtObject["indent"])
				_fmt.indent = fmtObject["indent"];
			if (fmtObject["leading"])
				_fmt.leading = fmtObject["leading"];
			this.setTextFormat(_fmt);
		}
		
		public function reflush():void
		{
			right = _right;
			left = _left;
			bottom = _bottom;
			top = _top;
		}
		
		/* INTERFACE com.wm.base.IPosition */
		
		public function set left(value:Object):void 
		{
			_left = int(value);
			if (this.parent) 
			{
				this.x = _left;
			}
		}
		
		public function set right(value:Object):void 
		{
			_right = int(value);
			if (this.parent) 
			{
				this.x = this.parent.width - this.width - _right;
			}
		}
		
		public function set top(value:Object):void 
		{
			_top = int(value);
			if (this.parent) 
			{
				this.y = _top;
			}
		}
		
		public function set bottom(value:Object):void 
		{
			_bottom = int(value);
			if (this.parent) 
			{
				this.y = this.parent.height - this.height - _bottom;
			}
		}
		
		/* INTERFACE wm.base.IDispose */
		
		public function dispose():void
		{
			_fmt = null;
		}
		
	}

}