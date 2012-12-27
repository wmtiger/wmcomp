package com.wm.utils 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * 关于位图的一些实用方法
	 * @author wmTiger
	 */
	public class BitmapDataUtil 
	{
		
		public function BitmapDataUtil() 
		{
			
		}
		
		/**
		 * 生成格式化好的位图3宫格，左或上为第一宫，中间为第二宫，右或下为第三宫，\n
		 * 注意只能生成比基本图大的位图数据
		 * @param bmd		传入一个BitmapData，最小长宽为5
		 * @param width		需要生成的BitmapData的长度
		 * @param height	需要生成的BitmapData的宽度
		 * @param type		需要生成的3宫格类型,type="lr"是左右宫格,type="tb"是上下宫格
		 * @param left		9宫格的左或上边线位置输入，默认是20
		 * @param right		9宫格的右或下边线位置输入，默认是20
		 * @return 
		 */
		public static function getBitmapData3Grid(sourceBmd:BitmapData, destWidth:int, destHeight:int, 
				type:String = "lr", left:int = 20, right:int = 20):BitmapData
		{
			if(sourceBmd == null || (sourceBmd.width < 5 && sourceBmd.height < 5))
			{
				throw new Error("输入的位图数据为空或格式不对");
			}
			
			var destBmd:BitmapData = new BitmapData(destWidth, destHeight, true, 0);
			var rect:Rectangle = new Rectangle();
			var point:Point = new Point();
			var cphtimes:int;
			var cpvtimes:int;
			var i:int;
			
			if (type == "lr") 
			{
				// grid 1
				rect.width = left;
				destBmd.copyPixels(sourceBmd, rect, point);
				// grid 2
				rect.width = sourceBmd.width - left - right;
				rect.x = left;
				cphtimes = WMath.ceil(destWidth / rect.width);
				for (i = 0; i < cphtimes; i++)
				{
					point.x = i * rect.width + left;
					destBmd.copyPixels(sourceBmd, rect, point);
				}
				// grid 3
				rect.width = right;
				rect.x = sourceBmd.width - right;
				point.x = destWidth - right;
				destBmd.copyPixels(sourceBmd, rect, point);
			}
			else
			{
				// grid 1
				rect.height = destHeight;
				destBmd.copyPixels(sourceBmd, rect, point);
				// grid 2
				rect.height = sourceBmd.height - left - right;
				rect.y = left;
				cpvtimes = WMath.ceil(destHeight / rect.height);
				for (i = 0; i < cpvtimes; i++)
				{
					point.y = i * rect.height + left;
					destBmd.copyPixels(sourceBmd, rect, point);
				}
				// grid 3
				rect.height = right;
				rect.y = sourceBmd.height - right;
				point.y = destHeight - right;
				destBmd.copyPixels(sourceBmd, rect, point);
			}
		}
		
		/**
		 * 生成格式化好的位图9宫格，左上角为第一宫，正上方为第二宫，依次类推，右下角为第四宫，\n
		 * 注意只能生成比基本图大的位图数据
		 * @param bmd		传入一个BitmapData，最小长宽为5
		 * @param width		需要生成的BitmapData的长度
		 * @param height	需要生成的BitmapData的宽度
		 * @param left		9宫格的左边线位置输入，默认是20
		 * @param right		9宫格的右边线位置输入，默认是20
		 * @param top		9宫格的上边线位置输入，默认是20
		 * @param bottom	9宫格的下边线位置输入，默认是20
		 * @return 
		 */
		public static function getBitmapData9Grid(sourceBmd:BitmapData, destWidth:int, destHeight:int, 
				left:int = 20, right:int = 20, top:int = 20, bottom:int = 20):BitmapData
		{
			if(sourceBmd == null || (sourceBmd.width < 5 && sourceBmd.height < 5))
			{
				throw new Error("输入的位图数据为空或格式不对");
			}
			
			var destBmd:BitmapData = new BitmapData(destWidth, destHeight, true, 0);
			var rect:Rectangle = new Rectangle();
			var point:Point = new Point();
			var cphtimes:int;
			var cpvtimes:int;
			var i:int;
			var j:int;
			
			// grid 1
			rect.width = left;
			rect.height = top;
			destBmd.copyPixels(sourceBmd, rect, point);
			// grid 2
			rect.width = sourceBmd.width - left - right;
			rect.x = left;
			cphtimes = WMath.ceil(destWidth / rect.width);
			for (i = 0; i < cphtimes; i++)
			{
				point.x = i * rect.width + left;
				destBmd.copyPixels(sourceBmd, rect, point);
			}
			// grid 3
			rect.width = right;
			rect.x = sourceBmd.width - right;
			point.x = destWidth - right;
			destBmd.copyPixels(sourceBmd, rect, point);
			// grid 4
			rect.width = left;
			rect.height = sourceBmd.height - top - bottom;
			rect.x = 0;
			rect.y = top;
			cpvtimes = WMath.ceil(destHeight / rect.height);
			for (i = 0; i < cpvtimes; i++)
			{
				point.x = 0;
				point.y = i * rect.height + top;
				destBmd.copyPixels(sourceBmd, rect, point);
			}
			// grid 5
			rect.width = sourceBmd.width - left - right;
			rect.height = sourceBmd.height - top - bottom;
			rect.x = left;
			rect.y = top;
			cphtimes = WMath.ceil(destWidth / rect.width);
			cpvtimes = WMath.ceil(destHeight / rect.height);
			for (j = 0; j < cpvtimes; j++)
			{
				point.y = j * rect.height + top;
				for (i = 0; i < cphtimes; i++)
				{
					point.x = i * rect.width + left;
					destBmd.copyPixels(sourceBmd, rect, point);
				}
			}
			// grid 6
			rect.width = right;
			rect.height = sourceBmd.height - top - bottom;
			rect.x = sourceBmd.width - right;
			rect.y = top;
			cpvtimes = WMath.ceil(destHeight / rect.height);
			for (i = 0; i < cpvtimes; i++)
			{
				point.x = destWidth - right;
				point.y = i * rect.height + top;
				destBmd.copyPixels(sourceBmd, rect, point);
			}
			// grid 7
			rect.width = left;
			rect.height = bottom;
			rect.x = 0;
			rect.y = sourceBmd.height - bottom;
			point.x = 0;
			point.y = destHeight - bottom;
			destBmd.copyPixels(sourceBmd, rect, point);
			// grid 8
			rect.width = sourceBmd.width - left - right;
			rect.x = left;
			cphtimes = WMath.ceil(destWidth / rect.width);
			for (i = 0; i < cphtimes; i++)
			{
				point.x = i * rect.width + left;
				destBmd.copyPixels(sourceBmd, rect, point);
			}
			// grid 9
			rect.width = right;
			rect.x = sourceBmd.width - right;
			point.x = destWidth - right;
			destBmd.copyPixels(sourceBmd, rect, point);
			
			return destBmd;
		}
		
	}

}