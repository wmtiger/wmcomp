package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.itemrender.ListItemRender;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	/**
	 * ...
	 * @author wmtiger
	 */
	public class WmList extends WmSprite 
	{
		protected var _listWidth:int;
		protected var _listHeight:int;
		protected var _style:String;
		protected var _listBg:Bitmap;
		protected var _data:Array;
		protected var _itemCls:ListItemRender;//list的item类
		protected var _listItems:Array;//list的item列表
		protected var _itemX:int;
		protected var _itemY:int;
		
		public function WmList(w:int = 100, h:int = 100) 
		{
			_listWidth = w;
			_listHeight = h;
			init();
		}
		
		private function init():void 
		{
			_itemX = 4;
			_itemY = 4;
			_listBg = new Bitmap();
			addChild(_listBg);
			flushBarPosition();
		}
		
		protected function flushBarPosition():void 
		{
			_listBg.bitmapData = getStyle("list_def_bg");
		}
		
		protected function getStyle(style:String):BitmapData
		{
			var bmp:Bitmap = Assets.instance.getSkinByType(style, "normal") as Bitmap;
			if (bmp == null) return null;
			if (chkBgBmd(bmp)) 
			{
				return bmp.bitmapData.clone();
			}
			return BitmapDataUtil.getBitmapData9Grid(bmp.bitmapData, _listWidth, _listHeight, 5, 5, 5, 5);
		}
		
		protected function chkBgBmd(bmp:Bitmap):Boolean
		{
			return bmp.width == _listWidth && bmp.height == _listHeight;
		}
		
		public function get listWidth():int 
		{
			return _listWidth;
		}

		public function get listHeight():int 
		{
			return _listHeight;
		}
		
		public function set data(arr:Array):void
		{
			_data = arr;
			_listItems = [];//这里是随手写的，这里要注意列表中的回收
			for (var i:int = 0; i < _data.length; i++) 
			{
				var item:ListItemRender = getItemCls();
				addChild(item);
				item.x = _itemX;
				item.y = _itemY + item.height * i;
			}
		}
		private function getItemCls():ListItemRender
		{
			return new ListItemRender(_listWidth);
		}
		
		public function get listNums():int
		{
			return _data == null ? 0 : _data.length;
		}
		
		public function set itemCls(value:ListItemRender):void 
		{
			_itemCls = value;
		}
		
	}

}