package com.dayvid.mvc.controller.controller_components
{
	import mvc_framework.controller.Controller;
	import mvc_framework.model.Model;

	public class ComponentController extends UI
	{
		// ABSTRACT CLASS (should be subclassed and not instantiated)
		public function ComponentController(aModel:Model, aController:Controller)
		{
			super();
			
			model = aModel;
			model.controller = aController;
		}
	}
}