package com.wm.itemrender 
{
	import com.wm.base.IListItemRender;
	import com.wm.comp.WmComp;
	import com.wm.comp.WmLabelBtn;
	import com.wm.comp.WmText;
	import flash.events.MouseEvent;
	
	/**
	 * 列表元素显示
	 * @author wmtiger
	 */
	public class ListItemRender extends WmLabelBtn implements IListItemRender
	{
		protected var _data:Object;
		protected var _selected:Boolean;
		
		public function ListItemRender(w:int = 0, h:int = 22) 
		{
			super("", w, h);
			
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			setWH(w, h, true);
			style = "";
			
			this.mouseChildren = false;
			
			initLabel();
		}
		
		override protected function setBtnEnabled(value:Boolean):void 
		{
			this.buttonMode = false;//一直都是不变手型的
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
		public function set data(value:Object):void 
		{
			_data = value;
			if (_data.name) 
			{
				label = _data.name;
			}
		}
		
		override public function set label(value:String):void 
		{
			_txt = value;
			
			//_label.text = "";
			_label.setText(_txt, true, true);
			_label.x = 3;
			_label.y = compHeight - _label.height >> 1;
		}
		
		override protected function onCompMDown(e:MouseEvent):void 
		{
			if (selected) 
			{
				return;
			}
			super.onCompMDown(e);
		}
		
		override protected function onCompMOut(e:MouseEvent):void 
		{
			if (selected) 
			{
				return;
			}
			super.onCompMOut(e);
		}
		
		override protected function onCompMOver(e:MouseEvent):void 
		{
			if (selected) 
			{
				return;
			}
			super.onCompMOver(e);
		}
		
		override protected function onCompMUp(e:MouseEvent):void 
		{
			if (selected) 
			{
				return;
			}
			super.onCompMUp(e);
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void 
		{
			if (selected == value) 
			{
				return;
			}
			_selected = value;
			
			if (_selected) 
			{
				setCrtBgBmd("down");
			}
			else
			{
				setCrtBgBmd("normal");
			}
		}
		
		override public function dispose():void 
		{
			_data = null;
			super.dispose();
		}
		
	}

}