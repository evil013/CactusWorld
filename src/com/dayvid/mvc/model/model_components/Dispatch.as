package com.dayvid.mvc.model.model_components 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Dispatch extends AbstractModel 
	{
		private var _whatUpdated:String = "none";
		
		public function Dispatch() 
		{
			////trace("Model");
			super();
		}
		
		// dispacth event and set what was updated
		protected function dispatchUpDate(aUpdate:String) 
		{
			_whatUpdated = aUpdate;
			dispatchEvent(new Event(Event.CHANGE));
		} 
		public function get whatUpdated():String 
		{
			return _whatUpdated;
		}
		public function testDispatch():void 
		{
			dispatchUpDate("testDispatch");
		}
	}
}