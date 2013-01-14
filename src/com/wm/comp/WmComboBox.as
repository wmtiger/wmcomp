package com.wm.comp 
{
	import com.wm.mgr.WmCompMgr;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * combobox的主按钮
	 * @author wmTiger
	 */
	public class WmComboBox extends WmLabelBtn 
	{
		private var _arrow:WmBackGround;
		private var _point:Point;
		private var _list:WmList;
		private var _opened:Boolean;
		private var _data:Array;
		
		public function WmComboBox(txt:String = "", w:int = 151, h:int = 25) 
		{
			super(txt, w, h);
			buttonMode = false;
			_point = new Point();
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			setWH(w, h);
			style = "combobox";
			
			this.mouseChildren = false;
			initArrow();
			
			initLabel();
			
			_list = new WmList(compWidth, 100);
			_list.addEventListener(Event.CHANGE, onChange);
		}
		
		private function onChange(e:Event):void 
		{
			close();
		}
		
		protected function initArrow():void
		{
			_arrow = new WmBackGround(12, 4);
			_arrow.style = "combobox_arrow";
			addChild(_arrow);
			_arrow.right = 0;
			_arrow.top = 11;
			_arrow.mouseEnabled = false;
		}
		
		public function set data(val:Array):void
		{
			_data = val;
			
			_list.data = _data;
			
			label = "" + _data[0].name;
		}
		
		override protected function onCompClick(e:MouseEvent):void 
		{
			super.onCompClick(e);
			trace("_opened",_opened);
			if (_opened) 
			{
				close();
			}
			else
			{
				open();
			}
		}
		
		public function close():void
		{
			if (_list && _list.parent) 
			{
				WmCompMgr.instance.getStage().removeChild(_list);
			}
			_opened = false;
		}
		
		public function open():void
		{
			if (_list) 
			{
				var p:Point = this.localToGlobal(_point);
				WmCompMgr.instance.getStage().addChild(_list);
				_list.y = p.y + compHeight;
				_list.x = p.x;
			}
			_opened = true;
		}
		
		override public function dispose():void 
		{
			if (_arrow) 
			{
				_arrow.dispose();
				_arrow = null;
			}
			super.dispose();
		}
		
	}

}