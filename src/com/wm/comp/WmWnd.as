package com.wm.comp 
{
	import com.wm.base.IDispose;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	/**
	 * 窗口
	 * @author wmtiger
	 */
	public class WmWnd extends WmComp 
	{
		private var _pivotX:int;//实际的注册点
		private var _pivotY:int;
		private var _title:String;
		private var _titleTxt:WmText;
		private var _closeBtn:WmBtn;//关闭按钮
		private var _maxBtn:WmBtn;//最大化按钮
		private var _minBtn:WmBtn;//最小化按钮
		private var _maxable:Boolean;//是否可以最大化
		private var _minable:Boolean;//是否可以最小化
		private var _content:WmComp;//内容
		private var _contentLeft:int;//内容面板的位置
		private var _contentRight:int;
		private var _contentTop:int;
		private var _contentBottom:int;
		
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
		
		protected function initWnd():void 
		{
			_pivotX = 16;
			_pivotY = 13;
			_titleTxt = new WmText(_title, _pivotX + 9, _pivotY + 9, compWidth - _pivotX * 2 - 8);
			addChild(_titleTxt);
			_titleTxt.selectable = false;
			
			_closeBtn = new WmBtn(64, 36);
			_closeBtn.style = "btn_close";
			addChild(_closeBtn);
			_closeBtn.right = 16;
			_closeBtn.top = 5;
			_closeBtn.clickHandler = function ():void 
			{
				closeWnd();
			}
			
			_maxBtn = new WmBtn(43, 36);
			_maxBtn.style = "btn_max";
			addChild(_maxBtn);
			_maxBtn.right = 64;
			_maxBtn.top = 5;
			_maxBtn.clickHandler = function ():void 
			{
				maxWnd();
			}
			maxable = false;
			
			_minBtn = new WmBtn(44, 36);
			_minBtn.style = "btn_min";
			addChild(_minBtn);
			_minBtn.right = 91;
			_minBtn.top = 5;
			_minBtn.clickHandler = function ():void 
			{
				minWnd();
			}
			minable = false;
			
			setDefStyle();
			
			setContent();
		}
		
		//皮肤素材不同，会导致_contentLeft等参数不同，需要覆盖重写
		protected function setContent():void 
		{
			_contentLeft = _contentRight = 24;
			_contentTop = 45;
			_contentBottom = 25;
			_content = new WmComp();
			addChild(_content);
			_content.left = _contentLeft;
			_content.top = _contentTop;
			flushWH();
		}
		
		public function get content():WmComp
		{
			return _content;
		}
		
		private function flushWH():void
		{
			if (_content) 
			{
				_content.setWH(compWidth - _contentLeft - _contentRight, 
						compHeight - _contentTop - _contentBottom, true);
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
			style = "wnd_def";
		}
		
		override protected function getBgBmd(bmp:Bitmap):BitmapData 
		{
			return BitmapDataUtil.getBitmapData9Grid(bmp.bitmapData, compWidth, compHeight, 30, 30, 90, 30);
		}
		
		public function addElement(disp:DisplayObject, x:int = 0, y:int = 0):void
		{
			_content.addChild(disp);
			disp.x = x;
			disp.y = y;
		}
		
		public function removeElement(disp:DisplayObject, dispose:Boolean = false):void
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