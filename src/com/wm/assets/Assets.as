package com.wm.assets 
{
	import com.wm.utils.HashTable;
	/**
	 * 皮肤资源
	 * @author wmTiger
	 */
	public class Assets extends Object
	{
		//btn_def
		[Embed(source = "assets.swf", symbol = "btn_def_normal")]
		public const btn_def_normal:Class;
		[Embed(source = "assets.swf", symbol = "btn_def_over")]
		public const btn_def_over:Class;
		[Embed(source = "assets.swf", symbol = "btn_def_down")]
		public const btn_def_down:Class;
		//btn_close
		[Embed(source = "assets.swf", symbol = "btn_close_normal")]
		public const btn_close_normal:Class;
		[Embed(source = "assets.swf", symbol = "btn_close_over")]
		public const btn_close_over:Class;
		[Embed(source = "assets.swf", symbol = "btn_close_down")]
		public const btn_close_down:Class;
		//btn_max
		[Embed(source = "assets.swf", symbol = "btn_max_normal")]
		public const btn_max_normal:Class;
		//btn_min
		[Embed(source = "assets.swf", symbol = "btn_min_normal")]
		public const btn_min_normal:Class;
		//wnd_def
		[Embed(source = "assets.swf", symbol = "wnd_def_normal")]
		public const wnd_def_normal:Class;
		//txt_def
		[Embed(source = "assets.swf", symbol = "txt_def_normal")]
		public const txt_def_normal:Class;
		[Embed(source = "assets.swf", symbol = "txt_def_over")]
		public const txt_def_over:Class;
		[Embed(source = "assets.swf", symbol = "txt_def_focusIn")]
		public const txt_def_focusIn:Class;
		//chkbox_def
		[Embed(source = "assets.swf", symbol = "chkbox_def_normal")]
		public const chkbox_def_normal:Class;
		[Embed(source = "assets.swf", symbol = "chkbox_def_over")]
		public const chkbox_def_over:Class;
		[Embed(source = "assets.swf", symbol = "chkbox_def_down")]
		public const chkbox_def_down:Class;
		[Embed(source = "assets.swf", symbol = "chkbox_def_selected_normal")]
		public const chkbox_def_selected_normal:Class;
		[Embed(source = "assets.swf", symbol = "chkbox_def_selected_over")]
		public const chkbox_def_selected_over:Class;
		[Embed(source = "assets.swf", symbol = "chkbox_def_selected_down")]
		public const chkbox_def_selected_down:Class;
		//radiobtn_def
		[Embed(source = "assets.swf", symbol = "radiobtn_def_normal")]
		public const radiobtn_def_normal:Class;
		[Embed(source = "assets.swf", symbol = "radiobtn_def_over")]
		public const radiobtn_def_over:Class;
		[Embed(source = "assets.swf", symbol = "radiobtn_def_down")]
		public const radiobtn_def_down:Class;
		[Embed(source = "assets.swf", symbol = "radiobtn_def_selected_normal")]
		public const radiobtn_def_selected_normal:Class;
		[Embed(source = "assets.swf", symbol = "radiobtn_def_selected_over")]
		public const radiobtn_def_selected_over:Class;
		[Embed(source = "assets.swf", symbol = "radiobtn_def_selected_down")]
		public const radiobtn_def_selected_down:Class;
		//slider_def
		[Embed(source = "assets.swf", symbol = "slider_def_normal")]
		public const slider_def_normal:Class;
		[Embed(source = "assets.swf", symbol = "slider_def_over")]
		public const slider_def_over:Class;
		[Embed(source = "assets.swf", symbol = "slider_def_down")]
		public const slider_def_down:Class;
		//sliderBar_def
		[Embed(source = "assets.swf", symbol = "sliderBar_def_normal")]
		public const sliderBar_def_normal:Class;
		//list_bg_def
		[Embed(source = "assets.swf", symbol = "list_bg_def_normal")]
		public const list_bg_def_normal:Class;
		//scroll_up_def
		[Embed(source = "assets.swf", symbol = "scroll_up_def_normal")]
		public const scroll_up_def_normal:Class;
		[Embed(source = "assets.swf", symbol = "scroll_up_def_over")]
		public const scroll_up_def_over:Class;
		[Embed(source = "assets.swf", symbol = "scroll_up_def_down")]
		public const scroll_up_def_down:Class;
		//scroll_down_def
		[Embed(source = "assets.swf", symbol = "scroll_down_def_normal")]
		public const scroll_down_def_normal:Class;
		[Embed(source = "assets.swf", symbol = "scroll_down_def_over")]
		public const scroll_down_def_over:Class;
		[Embed(source = "assets.swf", symbol = "scroll_down_def_down")]
		public const scroll_down_def_down:Class;
		//scroll_slider_def
		[Embed(source = "assets.swf", symbol = "scroll_slider_def_normal")]
		public const scroll_slider_def_normal:Class;
		[Embed(source = "assets.swf", symbol = "scroll_slider_def_over")]
		public const scroll_slider_def_over:Class;
		[Embed(source = "assets.swf", symbol = "scroll_slider_def_down")]
		public const scroll_slider_def_down:Class;
		//scroll_path_def
		[Embed(source = "assets.swf", symbol = "scroll_path_def_normal")]
		public const scroll_path_def_normal:Class;
		//scroll_slider_def
		[Embed(source = "assets.swf", symbol = "combobox_normal")]
		public const combobox_normal:Class;
		[Embed(source = "assets.swf", symbol = "combobox_over")]
		public const combobox_over:Class;
		[Embed(source = "assets.swf", symbol = "combobox_down")]
		public const combobox_down:Class;
		[Embed(source = "assets.swf", symbol = "combobox_arrow_normal")]
		public const combobox_arrow_normal:Class;
		
		private static var _instance:Assets;
		
		private var _table:HashTable;
		
		public function Assets() 
		{
			_table = new HashTable();
		}
		
		static public function get instance():Assets 
		{
			if (_instance == null) 
			{
				_instance = new Assets();
			}
			return _instance;
		}
		
		/**
		 * 通过具体类型获取单个具体皮肤，返回DisplayObject,自己注意好fla里面资源的类型定义
		 * @param	style		style名
		 * @param	type		style类型:over, down, normal, focusIn 中的一个
		 * @return
		 */
		public function getSkinByType(style:String, type:String = "normal"):*
		{
			var key:String = style + "_" + type;
			if (!_table.isHas(key)) 
			{
				if (this.hasOwnProperty(key)) 
				{
					_table.add(key, new (this[key])());
				}
				else
				{
					return null;
				}
			}
			return _table.getValue(key);
		}
		
	}

}