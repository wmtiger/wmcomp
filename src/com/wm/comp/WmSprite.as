package com.wm.comp 
{
	import com.wm.base.IDispose;
	import flash.display.Sprite;
	
	/**
	 * 简单精灵、容器
	 * @author wmTiger
	 */
	public class WmSprite extends Sprite implements IDispose
	{
		
		public function WmSprite() 
		{
			super();
		}
		
		/* INTERFACE wm.base.IDispose */
		
		public function dispose():void 
		{
			if (this.parent) 
			{
				this.parent.removeChild(this);
			}
		}
		
	}

}