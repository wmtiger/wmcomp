package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.base.IDispose;
	import com.wm.base.IPosition;
	import com.wm.utils.EventListenerUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	/**
	 * 组件基类
	 * @author wmtiger
	 */
	public class WmComp extends WmSprite
	{
		protected static const STYLE_LIST:Array = ["normal", "over", "down", "focusIn"];//不要dispose
		
		protected var _evtUtil:EventListenerUtil;
		protected var _normalBmd:BitmapData;//底图的位图数据-默认状态
		protected var _overBmd:BitmapData;//底图的位图数据-鼠标滑过
		protected var _downBmd:BitmapData;//底图的位图数据-鼠标按下
		protected var _focusInBmd:BitmapData;//底图的位图数据-焦点在其中
		
		protected var _style:String;
		
		private var _compWidth:int;//当前的spr的宽
		private var _compHeight:int;//当前的spr的高
		
		public function WmComp(w:int = 0, h:int = 0) 
		{
			_evtUtil = new EventListenerUtil();
			super();
			initComp(w, h);
			initEvt();
		}
		
		protected function initEvt():void 
		{
			_evtUtil.addEventListener(this, MouseEvent.CLICK, onCompClick);
			_evtUtil.addEventListener(this, MouseEvent.MOUSE_OVER, onCompMOver);
			_evtUtil.addEventListener(this, MouseEvent.MOUSE_OUT, onCompMOut);
			_evtUtil.addEventListener(this, MouseEvent.MOUSE_DOWN, onCompMDown);
			_evtUtil.addEventListener(this, MouseEvent.MOUSE_UP, onCompMUp);
		}
		
		protected function onCompMUp(e:MouseEvent):void 
		{
			setCrtBgBmd("over");
		}
		
		protected function onCompMOut(e:MouseEvent):void 
		{
			setCrtBgBmd("normal");
		}
		
		protected function onCompMDown(e:MouseEvent):void 
		{
			setCrtBgBmd("down");
		}
		
		protected function onCompMOver(e:MouseEvent):void 
		{
			setCrtBgBmd("over");
		}
		
		protected function onCompClick(e:MouseEvent):void 
		{
			
		}
		
		protected function initComp(w:int, h:int):void 
		{
			setWH(w, h);//此处这么写，没有画出默认背景，安全用的。继承的方法如有需要则各自重写
		}
		
		//画背景图
		protected function drawBg():void
		{
			if (style == null || style == "") 
			{
				drawGraphic();//此处要注意画的背景图是矢量透明图，在移动平台可能要修改
				return;
			}
			
			//将四种状态的位图都画好
			var bmp:Bitmap;
			for (var i:int = 0; i < STYLE_LIST.length; i++) 
			{
				bmp = Assets.instance.getSkinByType(style, STYLE_LIST[i]) as Bitmap;
				if (bmp) 
				{
					if (this["_" + STYLE_LIST[i] + "Bmd"]) 
					{
						this["_" + STYLE_LIST[i] + "Bmd"].dispose();
						this["_" + STYLE_LIST[i] + "Bmd"] = null;
					}
					this["_" + STYLE_LIST[i] + "Bmd"] = getBgBmd(bmp);
				}
				else
				{
					this["_" + STYLE_LIST[i] + "Bmd"] = null;
				}
			}
			setCrtBgBmd("normal");//默认画普通的背景
		}
		
		//设置当前要显示的位图数据,type为:normal, over, down, focusIn
		protected function setCrtBgBmd(type:String):void
		{
			_bgBmd = this["_" + type + "Bmd"] as BitmapData;
			drawGraphic(_bgBmd);
		}
		
		//需要改变获取位图的正确图像，必须覆盖此方法
		protected function getBgBmd(bmp:Bitmap):BitmapData
		{
			return null;
		}
		
		protected function drawGraphic(bmd:BitmapData = null):void
		{
			this.graphics.clear();
			if (bmd) 
			{
				this.graphics.beginBitmapFill(bmd, null, false);
			}
			else
			{
				if (_compWidth == 0 || _compHeight == 0) 
				{
					return;
				}
				this.graphics.beginFill(0xff0000, 0.1);
			}
			this.graphics.drawRect(0, 0, _compWidth, _compHeight);
			this.graphics.endFill();
		}
		
		/**
		 * 同时改变组件的高和宽。并且可以设置重绘组件背景，尽量少用
		 * @param	w
		 * @param	h
		 */
		public function setWH(w:int, h:int, draw:Boolean = false):void
		{
			_compWidth = w;
			_compHeight = h;
			if (draw) 
			{
				drawBg();
			}
		}
		
		public function get style():String 
		{
			return _style;
		}
		
		public function set style(value:String):void 
		{
			_style = value;
			
			drawBg();
		}
		
		public function get compWidth():int 
		{
			return _compWidth;
		}
		
		public function set compWidth(value:int):void 
		{
			_compWidth = value;
			drawBg();
		}
		
		public function get compHeight():int 
		{
			return _compHeight;
		}
		
		public function set compHeight(value:int):void 
		{
			_compHeight = value;
			drawBg();
		}
		
		override public function dispose():void 
		{
			super.dispose();
			if (_evtUtil) 
			{
				_evtUtil.dispose();
				_evtUtil = null;
			}
			_style = null;
			if (_overBmd) 
			{
				_overBmd.dispose();
				_overBmd = null;
			}
			if (_normalBmd) 
			{
				_normalBmd.dispose();
				_normalBmd = null;
			}
			if (_downBmd) 
			{
				_downBmd.dispose();
				_downBmd = null;
			}
			if (_focusInBmd) 
			{
				_focusInBmd.dispose();
				_focusInBmd = null;
			}
		}
		
	}

}