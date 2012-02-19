package com.dayvid.mvc.controller.controller_components 
{
	import mvc_framework.model.Model;
	
	import flash.errors.IllegalOperationError;
	import flash.filters.BitmapFilter;
	
	// ABSTRACT CLASS (should be subclassed and not instantiated)
	public class AbstractController 
	{
		protected var model:Model;
		
		public function AbstractController()
		{
			init();
		}
		
		// ABSTRACT METHOD (must be overridden in a subclass)
		protected function init():void
		{
			throw new IllegalOperationError("init method missing, this method must be overridden!");
		}
	}
}