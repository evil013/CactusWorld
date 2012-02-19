package com.dayvid.mvc.model.model_components{	import flash.display.DisplayObjectContainer;

	public class ComponentModel extends ModelStats	{				// ABSTRACT CLASS (should be subclassed and not instantiated)		public function ComponentModel(aTargetStage_mc:DisplayObjectContainer)		{			_targetStage_mc = aTargetStage_mc;						super();		}	}}