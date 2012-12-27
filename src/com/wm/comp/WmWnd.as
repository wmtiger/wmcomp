package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * 窗口
	 * @author wmtiger
	 */
	public class WmWnd extends WmSprite 
	{
		private var _wndWidth:int;
		private var _wndHeight:int;
		private var _pivotX:int;//实际的注册点
		private var _pivotY:int;
		private var _title:String;
		private var _titleTxt:WmText;
		private var _closeBtn:WmBtn;//关闭按钮
		private var _maxBtn:WmBtn;//最大化按钮
		private var _minBtn:WmBtn;//最小化按钮
		private var _maxable:Boolean;//是否可以最大化
		private var _minable:Boolean;//是否可以最小化
		
		public function WmWnd(title:String = "",w:int = 480, h:int = 300) 
		{
			_title = title;
			_wndWidth = w;
			_wndHeight = h;
			init();
			super();
		}
		
		protected function init():void 
		{
			_pivotX = 15;
			_pivotY = 12;
			drawGraphic();
			_titleTxt = new WmText(_title, _pivotX + 8, _pivotY + 8, _wndWidth - _pivotX * 2 - 8, 22, "SimSun", 16);
			addChild(_titleTxt);
			_titleTxt.selectable = false;
			
			_closeBtn = new WmBtn(64, 36);
			_closeBtn.style = "btn_normal_close_1";
			addChild(_closeBtn);
			_closeBtn.right = 17;
			_closeBtn.top = 5;
			_closeBtn.clickHandler = function ():void 
			{
				closeWnd();
			}
			
			_maxBtn = new WmBtn(43, 36);
			_maxBtn.style = "btn_normal_max_1";
			addChild(_maxBtn);
			_maxBtn.right = 65;
			_maxBtn.top = 5;
			
			_minBtn = new WmBtn(44, 36);
			_minBtn.style = "btn_normal_min_1";
			addChild(_minBtn);
			_minBtn.right = 92;
			_minBtn.top = 5;
		}
		
		override protected function drawBg():void 
		{
			var bmp:Bitmap = Assets.instance.getSkin(style) as Bitmap;
			_bgBmd = BitmapDataUtil.getBitmapData9Grid(bmp.bitmapData, _wndWidth, _wndHeight, 30, 30, 90, 30);
			drawGraphic(_bgBmd);
		}
		
		private function drawGraphic(bmd:BitmapData = null):void
		{
			this.graphics.clear();
			if (bmd) 
			{
				this.graphics.beginBitmapFill(bmd, null, false);
			}
			else
			{
				this.graphics.beginFill(0, 0);
			}
			this.graphics.drawRect(0, 0, _wndWidth, _wndHeight);
			this.graphics.endFill();
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
		
		override public function dispose():void 
		{
			if (this.parent) 
			{
				this.parent.removeChild(this);
			}
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
			super.dispose();
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
		
	}

}