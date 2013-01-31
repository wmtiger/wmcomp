package com.wm.comp 
{
	import com.wm.base.IGrid;
	import com.wm.mgr.AssetsMgr;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 * 物品格子
	 * @author wmtiger
	 */
	public class WmGrid extends WmSprite implements IGrid 
	{
		private var _gridId:String;
		protected var _gridBg:Bitmap;
		protected var _itemBm:Bitmap;//物品图片
		
		public function WmGrid(w:int = 44, h:int = 44) 
		{
			_sprWidth = w;
			_sprHeight = h;
			super();
			init();
		}
		
		private function init():void 
		{
			_gridBg = new Bitmap();
			addChild(_gridBg);
			_itemBm = new Bitmap();
			addChild(_itemBm);
			flushGridStyle();
		}
		
		protected function flushGridStyle():void 
		{
			_gridBg.bitmapData = getStyle("def_list_bg");
		}
		
		protected function getStyle(style:String):BitmapData
		{
			var bmp:BitmapData = AssetsMgr.instance.getSkinByAssetName(style.split("_")[0], style, "normal");
			if (bmp == null) return null;
			if (chkBgBmd(bmp)) 
			{
				return bmp.clone();
			}
			return BitmapDataUtil.getBitmapData9Grid(bmp, _sprWidth, _sprHeight, 5, 5, 5, 5);
		}
		protected function chkBgBmd(bmp:BitmapData):Boolean
		{
			return bmp.width == _sprWidth && bmp.height == _sprHeight;
		}
		
		/* INTERFACE com.wm.base.IGrid */
		
		public function showTip():void 
		{
			
		}
		
		public function hideTip():void 
		{
			
		}
		
		public function clear():void 
		{
			if (_itemBm) 
			{
				if (_itemBm.bitmapData) 
				{
					_itemBm.bitmapData.dispose();
				}
			}
		}
		
		public function applyData():void 
		{
			
		}
		
		protected function flushItemBmPosition():void
		{
			_itemBm.x = sprWidth - _itemBm.width >> 1;
			_itemBm.y = sprHeight - _itemBm.height >> 1;
		}
		
		public function getWidth():int 
		{
			return this.sprWidth;
		}
		
		public function getHeight():int 
		{
			return this.sprHeight;
		}
		
		public function set gridId(value:String):void 
		{
			_gridId = value;
		}
		
		public function get gridId():String 
		{
			return _gridId;
		}
		
		override public function dispose():void 
		{
			_gridId = null;
			if (_gridBg) 
			{
				if (_gridBg.bitmapData) 
				{
					_gridBg.bitmapData.dispose();
				}
				_gridBg = null;
			}
			if (_itemBm) 
			{
				if (_itemBm.bitmapData) 
				{
					_itemBm.bitmapData.dispose();
				}
				_itemBm = null;
			}
			super.dispose();
		}
		
	}

}