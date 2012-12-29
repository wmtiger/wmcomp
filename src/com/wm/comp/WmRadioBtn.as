package com.wm.comp 
{
	import flash.events.MouseEvent;
	/**
	 * 单选框-单行
	 * @author wmtiger
	 */
	public class WmRadioBtn extends WmChkBox 
	{
		private var _group:WmRadioGroup;
		
		public function WmRadioBtn(label:String = "单选框", w:int = 80, h:int = 22) 
		{
			super(label, w, h);
			
		}
		
		override protected function initStyle():void 
		{
			style = "radiobtn_def";
		}
		
		override protected function setSelectedStyle(val:Boolean):void 
		{
			style = val ? "radiobtn_def_selected" : "radiobtn_def";
		}
		
		override protected function onCompClick(e:MouseEvent):void 
		{
			if (!selected) 
			{
				_group.clearAllRadioSelect();
				selected = true;
				setCrtBgBmd("over");
			}
		}
		
		public function set group(g:WmRadioGroup):void
		{
			_group = g;
			
			_group.add(label + this.name, this);
		}
		
		override public function dispose():void 
		{
			super.dispose();
			_group = null;
		}
		
	}

}