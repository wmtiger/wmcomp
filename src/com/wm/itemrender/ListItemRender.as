package com.wm.itemrender 
{
	import com.wm.comp.WmComp;
	import com.wm.comp.WmLabelBtn;
	import com.wm.comp.WmText;
	
	/**
	 * 列表元素显示
	 * @author wmtiger
	 */
	public class ListItemRender extends WmLabelBtn 
	{
		protected var _data:Object;
		
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
			
			_label.setText(_txt, true, true);
			_label.x = 3;
			_label.y = compHeight - _label.height >> 1;
		}
		
		override public function dispose():void 
		{
			_data = null;
			super.dispose();
		}
		
	}

}