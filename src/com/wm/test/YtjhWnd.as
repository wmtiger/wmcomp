package test 
{
	import com.wm.comp.WmBtn;
	import com.wm.comp.WmWnd;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author wmtiger
	 */
	public class YtjhWnd extends WmWnd 
	{
		
		public function YtjhWnd(title:String="测试窗口", w:int=480, h:int=360) 
		{
			super(title, w, h);
			
		}
		
		override protected function setDefStyle():void 
		{
			style = "ytjh_window";
		}
		
		override protected function initWnd():void 
		{
			super.initWnd();
			
			
		}
		
		override protected function initCloseBtn():void 
		{
			_closeBtn = new WmBtn(24, 24);
			_closeBtn.style = "ytjh_btn_close";
			addElement(_closeBtn);
			_closeBtn.right = 10;
			_closeBtn.top = 7;
			_closeBtn.clickHandler = function ():void 
			{
				closeWnd();
			}
		}
		
		override protected function initMaxBtn():void { }
		
		override protected function initMinBtn():void { }
		
		override protected function initWndInfo():void 
		{
			_contentRect = new Rectangle(15, 40, compWidth - 15 - 15, compHeight - 40 - 15);
			_titleRect = new Rectangle(0, 0, compWidth, 40);
		}
		
		override protected function initTitle():void 
		{
			super.initTitle();
			flushTitleProp( { "color":0xffffff } );
		}
		
	}

}