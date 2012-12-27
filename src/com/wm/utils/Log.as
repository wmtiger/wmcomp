package com.wm.utils 
{
	import com.wm.comp.WmInput;
	import com.wm.comp.WmText;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.utils.getTimer;
	/**
	 * 简单的Log记录
	 * @author wmTiger
	 */
	public class Log 
	{
		public static var console:WmText;
		public static var input:WmInput;
		
		private static var _stage:Stage;
		
		public function Log() 
		{
			
		}
		
		public static function init(stage:Stage):void
		{
			_stage = stage;
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			console = new WmText("Log startup now!", 0, 0, 600, 400);
			console.background = true;
			console.backgroundColor = 0xcccccc;
			console.visible = false;
			
			input = new WmInput("Log startup now!", 0, 0, 600);
			input.setFormat( { "color":0xffffff } );
			input.background = true;
			input.backgroundColor = 0;
			input.visible = false;
			
		}
		
		private static function onKeyUp(event:KeyboardEvent):void
		{
			if (event.keyCode == 27)
			{
				//按下ESC键
				toogle();
			}
			if (event.keyCode == 13) 
			{
				//按下回车
				if (_stage.focus == input) 
				{
					//autoFullCmd();
					//parse();
					input.text = "";
				}
			}
		}
		
		static private function autoFullCmd():void 
		{
			var str:String = input.text + "";
			var idx:int = str.indexOf("start");
			if (idx == 0) 
			{
				input.text = "startrecord";
			}
			idx = str.indexOf("stop");
			if (idx == 0) 
			{
				input.text = "stop";
			}
			idx = str.indexOf("play");
			if (idx == 0) 
			{
				input.text = "playrecord";
			}
		}
		
		static private function parse():void 
		{
			var str:String = input.text + "";
			var idx:int = str.indexOf(" ");
			if (idx <= 0) 
			{
				if (chkCmd(str)) 
				{
					callCmd(str, []);
				}
				else
				{
					debug(str + "不是命令或格式有误");
				}
				return;
			}
			var cmd:String = str.substr(0, idx);
			str = str.substr(idx + 1);
			var arr:Array = str.split(" ");
			callCmd(cmd, arr);
		}
		private static function callCmd(cmd:String, args:Array):void
		{
			debug(cmd + " " + args);
			switch (cmd) 
			{
				case "reconnect":
					break;
				case "startrecord":
					//_handler.startRecord();
					break;
				case "stop":
					//_handler.stop();
					break;
				case "playrecord":
					//_handler.playRecord();
					break;
				default:
			}
		}
		private static function chkCmd(cmd:String):Boolean
		{
			var b:Boolean = false;
			switch (cmd) 
			{
				case "reconnect":
				case "startrecord":
				case "stop":
				case "playrecord":
					b = true;
				break;
				default:
			}
			return b;
		}
		/**
		 * 信息
		 */ 
		public static function info(...args):void
		{
			trace("[Info][" + getTimer() + "]: " + args);
			print("[Info][" + getTimer() + "]: " + args);
		}
		/**
		 * 错误
		 */ 
		public static function error(content:String):void
		{
			print("[Error]: "+content);
		}
		/**
		 * 打印信息
		 */ 
		private static function print(content:String):void
		{
			console.appendText("\n" + content);
			console.scrollV = console.maxScrollV;
		}
		/**
		 * 调试信息
		 * @param	content
		 */
		private static function debug(...args):void
		{
			print("[debug][" + getTimer() + "]: " + args);
		}
		/**
		 * 显示或掩藏控制台
		 */ 
		private static function toogle():void
		{
			if (console && input)
			{
				console.visible = input.visible = !console.visible;
				input.text = "";
				if (input.visible) 
				{
					_stage.focus = input;
				}
				if (console.parent) 
				{
					console.parent.setChildIndex(console, console.parent.numChildren - 1);
					input.parent.setChildIndex(input, input.parent.numChildren - 1);
				}
			}
		}
		
		//public static function setHandler(handler:IMicRecorder):void
		//{
			//_handler = handler;
		//}
		
	}

}