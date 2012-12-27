package com.wm.utils
{
	/**
	 * 关于计算的一些简单实现方法
	 * @author wmTiger
	 */
	public class WMath
	{
		public function WMath()
		{
		}
		
		/**
		 * 向下取整，eg:floor(2.3) => 2
		 * @param tmp
		 * @return 
		 */		
		public static function floor(tmp:Number):int
		{
			return int(tmp);
		}
		
		/**
		 * 向上取整，eg:ceil(2.3) => 3
		 * @param tmp
		 * @return 
		 */		
		public static function ceil(tmp:Number):int
		{
			return (tmp > int(tmp) ? int(tmp + 1) : int(tmp));
		}
		
		/**
		 * 得到绝对值
		 * @param tmp
		 * @return 
		 */		
		public static function abs(tmp:Number):Number
		{
			return (tmp >= 0 ? tmp : -tmp);
		}
	}
}