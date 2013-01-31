package com.wm.comp 
{
	import com.wm.base.IGrid;
	import com.wm.utils.HashTable;
	/**
	 * 物品格子的组
	 * @author wmtiger
	 */
	public class WmGirdGroup extends WmSprite
	{
		private var _row:int;
		private var _col:int;
		private var _hGap:int;
		private var _vGap:int;
		private var _gridCls:Class;
		
		private var _grids:HashTable;
		
		public function WmGirdGroup(gridCls:Class, row:int, col:int, hGap:int = 5, vGap:int = 5) 
		{
			_row = row;
			_col = col;
			_hGap = hGap;
			_vGap = vGap;
			_gridCls = gridCls;
			
			_grids = new HashTable();
			
			createGrids();
			
			this.mouseEnabled = false;
		}
		
		private function createGrids():void 
		{
			var grid:IGrid;
			var l:int = _row * _col;
			for (var i:int = 0; i < l; i++) 
			{
				grid = new _gridCls();
				this.addElement(WmGrid(grid), (i % _col) * (grid.getWidth() + _hGap), int(i / _col) * (grid.getHeight() + _vGap));
				grid.gridId = getKey(i);
				_grids.add(grid.gridId, grid);
			}
		}
		
		private function getKey(idx:int):String
		{
			return idx + "";
		}
		
		public function getGrid(idx:int):IGrid
		{
			return _grids.getValue(getKey(idx));
		}
		
	}

}