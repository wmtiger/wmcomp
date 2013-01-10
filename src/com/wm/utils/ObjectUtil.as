package com.wm.utils 
{
	/**
	 * ...
	 * @author wmtiger
	 */
	public class ObjectUtil 
	{
		
		public function ObjectUtil() 
		{
			
		}
		
		public static function convertObjToTarget(obj:Object, cls:Class):void
		{
			/*if(getQualifiedClassName(obj) != "Object")
			{
				var properties_xml:XML = describeType(obj);
				var accessor_xml:XMLList  = properties_xml.accessor;
				var key:String;
				
				var data:Object = {};
				var accesorLen:int = accessor_xml.length();
				for (var i:int = 0; i < accesorLen; i++) {
					if (accessor_xml[i].@access == "readonly") continue;
					key = accessor_xml[i].@name;
					data[key] = obj[key];
				}
				properties_xml = null;
				accessor_xml = null;
				return data;
			} else {
				if(obj.hasOwnProperty("_explicitType"))
				delete obj["_explicitType"];
				return obj;
			}
			
			if (obj != null) 
			{
				var description:XML = describeType(this);
				var xl:XMLList = description.variable;
				var str:String = "";
				for (var i:String in xl) 
				{
					str = xl[i].@name;
					if (obj[str]) 
					{
						this[str] = obj[str];
					}
				}
			}*/
		}
		
	}

}