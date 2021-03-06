package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.base.IListItemRender;
	import com.wm.base.IScroll;
	import com.wm.evt.WmCompEvt;
	import com.wm.itemrender.ListItemRender;
	import com.wm.mgr.AssetsMgr;
	import com.wm.utils.BitmapDataUtil;
	import com.wm.utils.EventListenerUtil;
	import com.wm.utils.WMath;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	/**
	 * 列表
	 * eg:
	 * var list:WmList = new WmList();
	 * addElementToContent(list);
	 * var arr:Array = getTestArr(20);
	 * list.data = arr;
	 * @author wmtiger
	 */
	public class WmList extends WmSprite implements IScroll
	{
		protected var _listWidth:int;
		protected var _listHeight:int;
		protected var _style:String;
		protected var _listBg:Bitmap;
		protected var _data:Array;
		protected var _listItems:Array;//list的item列表
		protected var _itemContent:WmSprite;//装list的容器
		protected var _itemX:int;
		protected var _itemY:int;
		protected var _listMask:Shape;//list列表的遮罩
		protected var _itemPools:Array;//item的pool池
		
		protected var _scrollPosition:String;//滚动条位置（左右）
		protected var _scroll:WmScroll;//滚动条
		protected var _evtUtil:EventListenerUtil;
		protected var _curSelectedItem:IListItemRender;//当前被选中的列表元素
		
		protected var _maxRow:int;//最大行数
		protected var _rowHeight:int;//当前每行的高
		protected var _process:Number;//当前显示容器的滚动的百分比
		
		/**
		 * 列表
		 * @param	w
		 * @param	h
		 * @param	maxRow		为0则显示固定高宽列表，>0则是定行数的显示列表,如果数据行数小于maxRow则自动显示当前行数
		 * @param	rowHeight	每一行的高
		 */
		public function WmList(w:int = 100, h:int = 100, maxRow:int = 4, rowHeight:int = 22) 
		{
			_maxRow = maxRow;
			_rowHeight = rowHeight;
			_evtUtil = new EventListenerUtil();
			_listWidth = w;
			_listHeight = h;
			init();
		}
		
		private function init():void 
		{
			_listItems = [];
			_itemPools = [];
			_itemX = 1;
			_itemY = 1;
			if (_maxRow > 0) 
			{
				_listHeight = _maxRow * _rowHeight + _itemX * 2;
			}
			
			_listBg = new Bitmap();
			addChild(_listBg);
			flushListStyle();
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
			
			setScrollPosition();
			_evtUtil.addEventListener(_itemContent, MouseEvent.CLICK, onClickContent);
			_evtUtil.addEventListener(_itemContent, MouseEvent.MOUSE_WHEEL, onWheelContent);
		}
		
		private function onWheelContent(e:MouseEvent):void 
		{
			trace(e.delta);
			if (e.delta > 0) 
			{
				//往上滚
				scrollUp(3);
			}
			else
			{
				//往下滚
				scrollDown(3);
			}
		}
		
		private function onClickContent(e:MouseEvent):void 
		{
			e.stopImmediatePropagation();
			if (e.target is IListItemRender) 
			{
				var item:IListItemRender = e.target as IListItemRender;
				/*if (item == _curSelectedItem) 
				{
					return;
				}*/
				
				var l:int = _listItems.length;
				for (var i:int = 0; i < l; i++) 
				{
					_listItems[i].selected = false;
				}
				item.selected = true;
				_curSelectedItem = item;
				
				this.dispatchEvent(new WmCompEvt(WmCompEvt.CHANGE, item));//更换选中对象
			}
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
		
		protected function flushListStyle():void 
		{
			_listBg.bitmapData = getStyle("def_list_bg");
		}
		
		protected function getStyle(style:String):BitmapData
		{
			var bmp:BitmapData = AssetsMgr.instance.getSkinByAssetName(style.split("_")[0], style, "normal");
			if (bmp == null) return null;
			if (chkBgBmd(bmp)) 
			{
				return bmp.clone();
			}
			return BitmapDataUtil.getBitmapData9Grid(bmp, _listWidth, _listHeight, 5, 5, 5, 5);
		}
		
		protected function chkBgBmd(bmp:BitmapData):Boolean
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
		
		protected function backAllItem():void
		{
			while (_listItems.length) 
			{
				backItem(_listItems.pop());
			}
		}
		protected function initScroll():void
		{
			if (_scroll == null) 
			{
				_scroll = new WmScroll(this, 17, listHeight - _itemY * 2);
				addChild(_scroll);
				
				_scroll.top = _itemY;
				_scroll.visible = false;
			}
		}
		public function set data(arr:Array):void
		{
			_data = arr;
			var i:int;
			var l:int;
			backAllItem();
			l = _data.length;
			for (i = 0; i < l; i++) 
			{
				var item:ListItemRender = getItem();
				item.data = _data[i];
				
				item.y = item.height * i;
				_listItems.push(item);
			}
			_itemContent.y = _itemY;
			
			chkScrollVisible();
			flushScrollPosition();
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
			item.selected = false;
			item.visible = false;
			item.y = 0;
		}
		
		public function get listNums():int
		{
			return _data == null ? 0 : _data.length;
		}
		
		override public function set bottom(value:Object):void 
		{
			_bottom = int(value);
			if (this.parent) 
			{
				//这里由于displayobjectcontainer不支持sprHeight属性，只有写死，看看后期会不会出问题
				this.y = this.parent["sprHeight"] - this.listHeight - _bottom;
			}
		}
		
		/* INTERFACE com.wm.base.IScroll */
		
		public function chkScrollVisible():void 
		{
			if (_itemContent.height > listHeight - _itemY * 2) 
			{
				initScroll();
				_scroll.flushSliderHeight((listHeight - _itemY * 2) / _itemContent.height);
				_scroll.visible = true;
			}
			else
			{
				if (_scroll) 
					_scroll.visible = false;
			}
		}
		
		public function scrollUp(unit:int = 1):void 
		{
			if (_itemContent.y < _itemY) 
			{
				if (WMath.abs(_itemContent.y) < _rowHeight * unit) 
				{
					_itemContent.y = _itemY;
					_process = 0;
				}
				else
				{
					_itemContent.y += _rowHeight * unit;
					_process = -(_itemContent.y - _itemY) / (getItemContentHeight());
				}
				_scroll.flushSliderBtnY(_process);
			}
		}
		
		private function getItemContentHeight():int
		{
			return _itemContent.height - listHeight - _itemY * 2;
		}
		
		public function scrollDown(unit:int = 1):void 
		{
			//还没好
			//trace(_itemContent.y - _itemY,getItemContentHeight());
			if (WMath.abs(_itemContent.y - _itemY) < getItemContentHeight()) 
			{
				if (WMath.abs(_itemContent.y - _itemY - _rowHeight * unit) > getItemContentHeight()) 
				{
					_itemContent.y = -(_itemContent.height - listHeight) - _itemY;
					_process = 1;
				}
				else
				{
					_itemContent.y -= _rowHeight * unit;
					_process = -(_itemContent.y - _itemY) / (getItemContentHeight());
				}
				_scroll.flushSliderBtnY(_process);
			}
		}
		
		public function scrollPosition(p:Number):void 
		{
			if (p == 1) 
			{
				_itemContent.y = listHeight - _itemY * 2 - _itemContent.height + _itemY;
				return;
			}
			_itemContent.y = _itemY - (getItemContentHeight()) * p;
			_process = p;
		}
		
		public function setScrollPosition(p:String = "right"):void 
		{
			_scrollPosition = p;
			flushScrollPosition();
		}
		
		//刷新滚动条所在的位置(靠左还是靠右)以及_itemContent的相对位置
		protected function flushScrollPosition():void
		{
			if (_scrollPosition == "left") 
			{
				if (_scroll) 
				{
					_scroll.left = _itemX;
					if (_scroll.visible) 
					{
						_itemContent.x = _itemX + _scroll.sprWidth;
					}
					else
					{
						_itemContent.x = _itemX;
					}
				}
			}
			else if (_scrollPosition == "right") 
			{
				if (_scroll) 
				{
					_scroll.right = _itemX;
					_itemContent.x = _itemX;
				}
			}
		}
		
		override public function dispose():void 
		{
			if (_evtUtil) 
			{
				_evtUtil.dispose();
				_evtUtil = null;
			}
			_style = null;
			if (_listBg) 
			{
				_listBg.parent.removeChild(_listBg);
				_listBg.bitmapData.dispose();
				_listBg = null;
			}
			_data = null;
			backAllItem();
			_listItems = null;
			if (_itemContent) 
			{
				_itemContent.parent.removeChild(_itemContent);
				_itemContent.dispose();
				_itemContent = null;
			}
			if (_scroll) 
			{
				_scroll.dispose();
				_scroll = null;
			}
			for (var i:int = 0; i < _itemPools.length; i++) 
			{
				var item:ListItemRender = _itemPools[i] as ListItemRender;
				item.dispose();
				item = null;
			}
			_itemPools = null;
			_scrollPosition = null;
			_curSelectedItem = null;
			
			super.dispose();
			_listMask = null;
		}
		
	}

}