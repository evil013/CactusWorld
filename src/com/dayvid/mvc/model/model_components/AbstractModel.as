package com.dayvid.mvc.model.model_components 
{
	import flash.display.DisplayObjectContainer;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	// ABSTRACT CLASS (should be subclassed and not instantiated)
	public class AbstractModel extends EventDispatcher 
	{
		protected var _targetStage_mc:DisplayObjectContainer
		
		public function AbstractModel() 
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