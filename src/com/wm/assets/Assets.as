package com.wm.assets 
{
	import com.wm.base.IAssets;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * def皮肤资源
	 * @author wmTiger
	 */
	public class Assets implements IAssets 
	{
		//btn_def
		[Embed(source = "assets.swf", symbol = "def_btn_normal")]
		public const def_btn_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_btn_over")]
		public const def_btn_over:Class;
		[Embed(source = "assets.swf", symbol = "def_btn_down")]
		public const def_btn_down:Class;
		//btn_close
		[Embed(source = "assets.swf", symbol = "def_btn_close_normal")]
		public const def_btn_close_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_btn_close_over")]
		public const def_btn_close_over:Class;
		[Embed(source = "assets.swf", symbol = "def_btn_close_down")]
		public const def_btn_close_down:Class;
		//btn_max
		[Embed(source = "assets.swf", symbol = "def_btn_max_normal")]
		public const def_btn_max_normal:Class;
		//btn_min
		[Embed(source = "assets.swf", symbol = "def_btn_min_normal")]
		public const def_btn_min_normal:Class;
		//wnd_def
		[Embed(source = "assets.swf", symbol = "def_wnd_normal")]
		public const def_wnd_normal:Class;
		//txt_def
		[Embed(source = "assets.swf", symbol = "def_txt_normal")]
		public const def_txt_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_txt_over")]
		public const def_txt_over:Class;
		[Embed(source = "assets.swf", symbol = "def_txt_focusIn")]
		public const def_txt_focusIn:Class;
		//chkbox_def
		[Embed(source = "assets.swf", symbol = "def_chkbox_normal")]
		public const def_chkbox_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_chkbox_over")]
		public const def_chkbox_over:Class;
		[Embed(source = "assets.swf", symbol = "def_chkbox_down")]
		public const def_chkbox_down:Class;
		[Embed(source = "assets.swf", symbol = "def_chkbox_selected_normal")]
		public const def_chkbox_selected_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_chkbox_selected_over")]
		public const def_chkbox_selected_over:Class;
		[Embed(source = "assets.swf", symbol = "def_chkbox_selected_down")]
		public const def_chkbox_selected_down:Class;
		//radiobtn_def
		[Embed(source = "assets.swf", symbol = "def_radiobtn_normal")]
		public const def_radiobtn_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_radiobtn_over")]
		public const def_radiobtn_over:Class;
		[Embed(source = "assets.swf", symbol = "def_radiobtn_down")]
		public const def_radiobtn_down:Class;
		[Embed(source = "assets.swf", symbol = "def_radiobtn_selected_normal")]
		public const def_radiobtn_selected_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_radiobtn_selected_over")]
		public const def_radiobtn_selected_over:Class;
		[Embed(source = "assets.swf", symbol = "def_radiobtn_selected_down")]
		public const def_radiobtn_selected_down:Class;
		//slider_def
		[Embed(source = "assets.swf", symbol = "def_slider_normal")]
		public const def_slider_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_slider_over")]
		public const def_slider_over:Class;
		[Embed(source = "assets.swf", symbol = "def_slider_down")]
		public const def_slider_down:Class;
		//sliderBar_def
		[Embed(source = "assets.swf", symbol = "def_sliderBar_normal")]
		public const def_sliderBar_normal:Class;
		//list_bg_def
		[Embed(source = "assets.swf", symbol = "def_list_bg_normal")]
		public const def_list_bg_normal:Class;
		//scroll_up_def
		[Embed(source = "assets.swf", symbol = "def_scroll_up_normal")]
		public const def_scroll_up_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_scroll_up_over")]
		public const def_scroll_up_over:Class;
		[Embed(source = "assets.swf", symbol = "def_scroll_up_down")]
		public const def_scroll_up_down:Class;
		//scroll_down_def
		[Embed(source = "assets.swf", symbol = "def_scroll_down_normal")]
		public const def_scroll_down_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_scroll_down_over")]
		public const def_scroll_down_over:Class;
		[Embed(source = "assets.swf", symbol = "def_scroll_down_down")]
		public const def_scroll_down_down:Class;
		//scroll_slider_def
		[Embed(source = "assets.swf", symbol = "def_scroll_slider_normal")]
		public const def_scroll_slider_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_scroll_slider_over")]
		public const def_scroll_slider_over:Class;
		[Embed(source = "assets.swf", symbol = "def_scroll_slider_down")]
		public const def_scroll_slider_down:Class;
		//scroll_path_def
		[Embed(source = "assets.swf", symbol = "def_scroll_path_normal")]
		public const def_scroll_path_normal:Class;
		//combobox
		[Embed(source = "assets.swf", symbol = "def_combobox_normal")]
		public const def_combobox_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_combobox_over")]
		public const def_combobox_over:Class;
		[Embed(source = "assets.swf", symbol = "def_combobox_down")]
		public const def_combobox_down:Class;
		[Embed(source = "assets.swf", symbol = "def_combobox_arrow_normal")]
		public const def_combobox_arrow_normal:Class;
		//tab
		[Embed(source = "assets.swf", symbol = "def_btn_tab_normal")]
		public const def_btn_tab_normal:Class;
		[Embed(source = "assets.swf", symbol = "def_btn_tab_over")]
		public const def_btn_tab_over:Class;
		[Embed(source = "assets.swf", symbol = "def_btn_tab_down")]
		public const def_btn_tab_down:Class;
		
		public function Assets() 
		{
		}
		
		/* INTERFACE com.wm.base.IAssets */
		
		public function getSkin(key:String):BitmapData 
		{
			var skin:BitmapData;
			if (this.hasOwnProperty(key)) 
			{
				skin = Bitmap(new (this[key])()).bitmapData;
			}
			return skin;
		}
		
	}

}