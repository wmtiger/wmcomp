package 
{
	import com.wm.comp.WmInput;
	import com.wm.comp.WmText;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author wmTiger
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var input:WmInput = new WmInput();
			input.def = "在此输入";
			input.text = input.def;
			addChild(input);
			input.border = true;
			
			var txt:WmText = new WmText("",120);
			txt.htmlText = "<font size='14' color='#ff0000'>你好</font>"
			txt.text = "";
			txt.text = "啊的";
			addChild(txt);
		}
		
	}
	
}