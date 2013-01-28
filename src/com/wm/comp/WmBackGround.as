package com.wm.comp 
{
	import com.wm.assets.Assets;
	import com.wm.mgr.AssetsMgr;
	import com.wm.utils.BitmapDataUtil;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	/**
	 * 用来填充背景底图
	 * @author wmTiger
	 */
	public class WmBackGround extends WmSprite 
	{
		private var _style:String;
		private var _type:String;
		private var _bmd:BitmapData;
		
		public function WmBackGround(w:int = 0, h:int = 0) 
		{
			super();
			type = "normal";//默认是普通状态
			setWH(w, h);
			this.mouseChildren = false;
		}
		
		//画背景图
		protected function drawBg():void
		{
			if (style == null || style == "") 
			{
				drawGraphic();//此处要注意画的背景图是矢量透明图，在移动平台可能要修改
				return;
			}
			//var bmp:Bitmap = Assets.instance.getSkinByType(style, type) as Bitmap;
			var bmp:Bitmap = AssetsMgr.instance.getSkinByAssetName(style.split("_")[0], style, type);
			if (bmp) 
			{
				_bmd = getBgBmd(bmp);
				drawGraphic(_bmd);
			}
		}
		protected function drawGraphic(bmd:BitmapData = null):void
		{
			this.graphics.clear();
			if (sprWidth == 0 || sprHeight == 0) 
			{
				return;
			}
			if (bmd) 
			{
				this.graphics.beginBitmapFill(bmd, null, false);
			}
			else
			{
				this.graphics.beginFill(0x0000ff, 0.1);
			}
			this.graphics.drawRect(0, 0, sprWidth, sprHeight);
			this.graphics.endFill();
		}
		
		//需要改变获取位图的正确图像，必须覆盖此方法
		protected function getBgBmd(bmp:Bitmap):BitmapData 
		{
			if (chkBgBmd(bmp)) 
			{
				return bmp.bitmapData.clone();
			}
			return BitmapDataUtil.getBitmapData9Grid(bmp.bitmapData, sprWidth, sprHeight, 10, 10, 10, 10);
		}
		protected function chkBgBmd(bmp:Bitmap):Boolean
		{
			return bmp.width == sprWidth && bmp.height == sprHeight;
		}
		
		/**
		 * 同时改变组件的高和宽。并且可以设置重绘组件背景，尽量少用
		 * @param	w			高
		 * @param	h			宽
		 * @param	draw		是否重绘背景
		 */
		override public function setWH(w:int, h:int, draw:Boolean = false):void 
		{
			super.setWH(w, h, draw);
			drawBg();
		}
		override protected function drawDefBg():void { }
		
		/**
		 * 设置风格和类型
		 * @param	style	一般用于9宫格小位图
		 */
		public function set style(value:String):void 
		{
			_style = value;
			
			drawBg();
		}
		
		public function get style():String 
		{
			return _style;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function set type(value:String):void 
		{
			_type = value;
		}
		
		override public function dispose():void
		{
			_style = null;
			_type = null;
			if (_bmd) 
			{
				_bmd.dispose();
				_bmd = null;
			}
			super.dispose();
		}
		
	}

}