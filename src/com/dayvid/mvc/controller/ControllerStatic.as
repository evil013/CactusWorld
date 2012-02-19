package com.dayvid.mvc.controller
{
	import mvc_framework.controller.Controller;

	public class ControllerStatic
	{
		private static var _controller:Controller;
		
		public function ControllerStatic()
		{
		}
		
		public static function set controller(value:Controller):void
		{
			if (_controller == null) 
			{
				_controller = value;
			}
			else
			{
				throw new Error("Attempt to set controller more than once!!");
			}
		}
		
		public static function get controller():Controller
		{
			return _controller;
		}
	}
}