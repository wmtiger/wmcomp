package com.wm.comp 
{
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	/**
	 * 简单图形按钮,默认的w和h是根据资源中来的，如果有其他的资源，自己修改
	 * @author wmtiger
	 */
	public class WmBtn extends WmComp 
	{
		private var _clickHandler:Function;
		
		public function WmBtn(w:int = 73, h:int = 19) 
		{
			super(w, h);
		}
		
		override protected function initComp(w:int, h:int):void 
		{
			setWH(w, h, true);
			style = "btn_def";
			
			this.mouseChildren = false;
		}
		
		override protected function onCompMUp(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			setCrtBgBmd("over");
		}
		
		override protected function onCompMOut(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			setCrtBgBmd("normal");
		}
		
		override protected function onCompMDown(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			setCrtBgBmd("down");
		}
		
		override protected function onCompMOver(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			setCrtBgBmd("over");
		}
		
		override protected function onCompClick(e:MouseEvent):void 
		{
			if (!enabled) 
			{
				return;
			}
			if (_clickHandler != null) 
			{
				_clickHandler.call();
			}
		}
		
		override public function set enabled(value:Boolean):void 
		{
			_enabled = value;
			if (_enabled) 
			{
				this.alpha = 1;
				this.buttonMode = true;
				this.mouseEnabled = true;
			}
			else
			{
				this.alpha = 0.5;
				this.buttonMode = false;
				this.mouseEnabled = false;
			}
		}
		
		override protected function getBgBmd(bmp:Bitmap):BitmapData 
		{
			if (chkBgBmd(bmp)) 
			{
				return bmp.bitmapData.clone();
			}
			return BitmapDataUtil.getBitmapData3Grid(bmp.bitmapData, compWidth, compHeight);
		}
		
		public function set clickHandler(value:Function):void 
		{
			_clickHandler = value;
		}
		
		override public function dispose():void 
		{
			super.dispose();
			_clickHandler = null;
		}
		
	}

}