package com.wm.data 
{
	/**
	 * 树节点数据结构
	 * @author wmtiger
	 */
	public class TreeNode extends CompData 
	{
		public var parent:TreeNode;
		public var children:Vector.<TreeNode>;
		public var data:Object;
		
		public function TreeNode() 
		{
			super();
			children = new Vector.<TreeNode>();
		}
		
		public function hasParent():Boolean
		{
			return parent != null;
		}
		
		public function hasChildren():Boolean
		{
			return children.length > 0;
		}
		
		/**
		 * 获取兄弟(同父亲的)节点(包括自己)
		 */
		public function get brothers():Vector.<TreeNode>
		{
			if (hasParent()) 
			{
				return this.parent.children;
			}
			return null;
		}
		
		/**
		 * 获取堂兄弟(同祖父的)节点(包括自己)
		 */
		public function get cousins():Vector.<TreeNode>
		{
			var cv:Vector.<TreeNode> = new Vector.<TreeNode>();
			if (hasParent()) 
			{
				if (this.parent.hasParent()) 
				{
					var gf:TreeNode = this.parent.parent;
					var tmp:Vector.<TreeNode> = gf.children;
					var l:int = tmp.length;
					for (var i:int = 0; i < l; i++) 
					{
						cv = cv.concat(tmp[i].children);
					}
				}
				else
				{
					cv = brothers;
				}
			}
			return cv;
		}
		
	}

}