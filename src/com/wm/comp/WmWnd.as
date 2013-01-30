package com.wm.comp 
{
	import com.wm.base.IDispose;
	import com.wm.mgr.WmCompMgr;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	/**
	 * 窗口
	 * @author wmtiger
	 */
	public class WmWnd extends WmComp 
	{
		private var _pivotX:int;//实际的注册点
		private var _pivotY:int;
		private var _titleBar:WmSprite;
		private var _title:String;
		private var _titleTxt:WmText;
		protected var _titleRect:Rectangle;
		protected var _closeBtn:WmBtn;//关闭按钮
		protected var _maxBtn:WmBtn;//最大化按钮
		protected var _minBtn:WmBtn;//最小化按钮
		private var _maxable:Boolean;//是否可以最大化
		private var _minable:Boolean;//是否可以最小化
		private var _content:WmSprite;//内容
		protected var _contentRect:Rectangle;//内容面板的位置
		
		public function WmWnd(title:String = "", w:int = 480, h:int = 360) 
		{
			_title = title;
			super(w, h);
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			setWH(w, h, true);//初始化界面大小的同时画出界面
			initWnd();
		}
		
		override protected function initEvt():void 
		{
			//去掉原始监听
		}
		
		protected function initWnd():void 
		{
			initWndInfo();
			initTitle();
			initCloseBtn();
			initMaxBtn();
			initMinBtn();
			setDefStyle();
			setContent();
		}
		
		protected function initWndInfo():void
		{
			//初始化注册点
			_pivotX = 16;
			_pivotY = 13;
			//初始化内容面板位置以及大小
			_contentRect = new Rectangle(24, 45, compWidth - 24 - 24, compHeight - 45 - 25);
			//初始化标题位置
			_titleRect = new Rectangle(0, 0, compWidth, 45);
		}
		
		protected function initTitle():void
		{
			_titleBar = new WmSprite();
			_titleBar.setWH(_titleRect.width, _titleRect.height, true);
			addElement(_titleBar);
			_evtUtil.addEventListener(_titleBar, MouseEvent.MOUSE_DOWN, onTitleDown);
			_titleBar.mouseChildren = false;
			_titleTxt = new WmText();
			_titleTxt.setText(_title, true, true);
			_titleBar.addElement(_titleTxt);
			flushTitlePosition();
		}
		private function onTitleUp(e:MouseEvent):void 
		{
			_evtUtil.removeEventListener(WmCompMgr.instance.getStage(), MouseEvent.MOUSE_UP, onTitleUp);
			this.stopDrag();
		}
		private function onTitleDown(e:MouseEvent):void 
		{
			_evtUtil.addEventListener(WmCompMgr.instance.getStage(), MouseEvent.MOUSE_UP, onTitleUp);
			this.startDrag();
		}
		//刷新标题文本位置
		protected function flushTitlePosition():void 
		{
			_titleTxt.x = ((_titleRect.width - _titleTxt.width) >> 1);
			_titleTxt.y = ((_titleRect.height - _titleTxt.height + _pivotY) >> 1);
		}
		protected function flushTitleProp(obj:Object):void
		{
			_titleTxt.setFormat(obj);
		}
		
		protected function initCloseBtn():void
		{
			_closeBtn = new WmBtn(64, 36);
			_closeBtn.style = "def_btn_close";
			addElement(_closeBtn);
			_closeBtn.right = 16;
			_closeBtn.top = 5;
			_closeBtn.clickHandler = function ():void 
			{
				closeWnd();
			}
		}
		
		protected function initMaxBtn():void
		{
			_maxBtn = new WmBtn(43, 36);
			_maxBtn.style = "def_btn_max";
			addElement(_maxBtn);
			_maxBtn.right = 64;
			_maxBtn.top = 5;
			_maxBtn.clickHandler = function ():void 
			{
				maxWnd();
			}
			maxable = false;
		}
		
		protected function initMinBtn():void
		{
			_minBtn = new WmBtn(44, 36);
			_minBtn.style = "def_btn_min";
			addElement(_minBtn);
			_minBtn.right = 91;
			_minBtn.top = 5;
			_minBtn.clickHandler = function ():void 
			{
				minWnd();
			}
			minable = false;
		}
		
		//皮肤素材不同，会导致_contentRect等参数不同，需要覆盖重写
		protected function setContent():void 
		{
			_content = new WmSprite();
			addElement(_content);
			_content.left = _contentRect.x;
			_content.top = _contentRect.y;
			flushWH();
		}
		
		public function get content():WmSprite
		{
			return _content;
		}
		
		private function flushWH():void
		{
			if (_content) 
			{
				_content.setWH(_contentRect.width, _contentRect.height, true);
			}
		}
		
		override public function setWH(w:int, h:int, draw:Boolean = false):void 
		{
			super.setWH(w, h, draw);
			if (draw) 
			{
				flushWH();
			}
		}
		
		//如果要自定义窗体，则将此方法覆盖为空方法，再行修改style
		protected function setDefStyle():void
		{
			style = "def_wnd";
		}
		
		override protected function getBgBmd(bmp:BitmapData):BitmapData 
		{
			if (chkBgBmd(bmp)) 
			{
				return bmp.clone();
			}
			return BitmapDataUtil.getBitmapData9Grid(bmp, compWidth, compHeight, 30, 30, 90, 30);
		}
		
		public function addElementToContent(disp:DisplayObject, x:int = 0, y:int = 0):void
		{
			_content.addElement(disp, x, y);
		}
		
		public function removeElementFromContent(disp:DisplayObject, dispose:Boolean = false):void
		{
			_content.removeChild(disp);
			if (dispose) 
			{
				disp["dispose"]();
				disp = null;
			}
		}
		
		public function closeWnd():void
		{
			dispose();
		}
		
		public function maxWnd():void
		{
			
		}
		
		public function minWnd():void
		{
			
		}
		
		public function get minable():Boolean 
		{
			return _minable;
		}
		
		public function set minable(value:Boolean):void 
		{
			_minable = value;
			_minBtn.enabled = _minable;
		}
		
		public function get maxable():Boolean 
		{
			return _maxable;
		}
		
		public function set maxable(value:Boolean):void 
		{
			_maxable = value;
			_maxBtn.enabled = _maxable;
		}
		
		public function get pivotX():int 
		{
			return _pivotX;
		}
		
		public function set pivotX(value:int):void 
		{
			_pivotX = value;
		}
		
		public function get pivotY():int 
		{
			return _pivotY;
		}
		
		public function set pivotY(value:int):void 
		{
			_pivotY = value;
		}
		
		override public function dispose():void 
		{
			super.dispose();
			_title = null;
			_contentRect = null;
			if (_titleTxt) 
			{
				_titleTxt.dispose();
				_titleTxt = null;
			}
			if (_closeBtn) 
			{
				_closeBtn.dispose();
				_closeBtn = null;
			}
			if (_maxBtn) 
			{
				_maxBtn.dispose();
				_maxBtn = null;
			}
			if (_minBtn) 
			{
				_minBtn.dispose();
				_minBtn = null;
			}
			if (_content) 
			{
				_content.dispose();
				_content = null;
			}
		}
		
	}

}