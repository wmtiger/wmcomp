package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.itemrender.ListItemRender;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Rectangle;
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
		protected var _itemContent:WmSprite;//装list的容器
		protected var _itemX:int;
		protected var _itemY:int;
		protected var _listMask:Shape;//list列表的遮罩
		protected var _itemPools:Array;//item的pool池
		
		public function WmList(w:int = 100, h:int = 100) 
		{
			_listWidth = w;
			_listHeight = h;
			init();
		}
		
		private function init():void 
		{
			_listItems = [];
			_itemPools = [];
			_itemX = 4;
			_itemY = 4;
			_listBg = new Bitmap();
			addChild(_listBg);
			flushBarPosition();
			_itemContent = new WmSprite();
			addChild(_itemContent);
			_itemContent.x = _itemX;
			_itemContent.y = _itemY;
			_listMask = new Shape();
			_listMask.graphics.beginFill(0);
			_listMask.graphics.drawRect(0, 0, 10, 10);
			_listMask.graphics.endFill();
			addChild(_listMask);
			_listMask.x = _itemX;
			_listMask.y = _itemY;
			resetContent(_listWidth - _itemX * 2, _listHeight - _itemY * 2);
			_itemContent.mask = _listMask;
		}
		
		protected function resetContent(w:int, h:int, resetRender:Boolean = false):void
		{
			_itemContent.setWH(w, h, true);
			
			//可酌情选择开启或者不开启
			if (resetRender) 
			{
				var l:int = _listItems.length;
				var item:ListItemRender;
				for (var i:int = 0; i < l; i++) 
				{
					item = _listItems[i] as ListItemRender;
					item.setWH(w, h, true);
				}
			}
			
			_listMask.width = _itemContent.sprWidth;
			_listMask.height = _itemContent.sprHeight;
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
			var i:int;
			var l:int;
			while (_listItems.length) 
			{
				backItem(_listItems.pop());
			}
			l = _data.length;
			for (i = 0; i < l; i++) 
			{
				var item:ListItemRender = getItem();
				item.data = _data[i];
				
				item.y = item.height * i;
				_listItems.push(item);
			}
			_itemContent.y = _itemY;
		}
		private function getItem():ListItemRender
		{
			var item:ListItemRender;
			if (_itemPools.length == 0) 
			{
				item = new ListItemRender(_itemContent.sprWidth);
				_itemContent.addChild(item);
			}
			else
			{
				item = _itemPools.pop() as ListItemRender;
			}
			item.y = 0;
			item.visible = true;
			return item;
		}
		private function backItem(item:ListItemRender):void
		{
			_itemPools.push(item);
			item.visible = false;
			item.y = 0;
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