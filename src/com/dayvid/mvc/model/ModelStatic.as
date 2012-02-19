package com.dayvid.mvc.model
{
	import mvc_framework.model.Model;

	public class ModelStatic
	{
		private static var _model:Model;
		
		public function ModelStatic()
		{
		}
		
		public static function set model(value:Model):void
		{
			if (_model == null) 
			{
				_model = value;
			}
			else
			{
				throw new Error("Attempt to set model more than once!!");
			}
		}
		
		public static function get model():Model
		{
			return _model;
		}
	}
}