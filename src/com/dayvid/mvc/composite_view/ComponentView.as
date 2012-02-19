﻿package com.dayvid.mvc.composite_view {	import com.dayvid.mvc.controller.TransitionTypes;	import com.dayvid.util.RemoveChildren;		import flash.display.DisplayObjectContainer;	import flash.display.Sprite;	import flash.errors.IllegalOperationError;	import flash.events.Event;		import mvc_framework.controller.Controller;	import mvc_framework.model.Model;
	// ABSTRACT CLASS (should be subclassed and not instantiated)	public class ComponentView extends Sprite 	{		// Finite States		public static const IN_TRANSITION:String = "in transition";		public static const DISABLED:String = "desabled";		public static const ENABLED:String = "enabled";				// States		public static const DEFAULT_STATE:String = "default state";				// Events		public static const OUTRO_COMPLETED:String = "outro completed";		public static const INTRO_COMPLETED:String = "intro completed";		public static const DISPOSED:String = "disposed";		public static const CHANGE:String = "change";				protected var model:Model;		protected var controller:Controller;		protected var targetStage_mc:DisplayObjectContainer;		protected var parentView:CompositeView;		protected var disabled:Boolean = false;		protected var cleanedUp:Boolean = false;		protected var _transitionActive:Boolean = false;		protected var _transitionOnType:String = TransitionTypes.NONE;		protected var _transitionOffType:String = TransitionTypes.NONE;		protected var _state:String = DEFAULT_STATE;				public function ComponentView()		{			//trace ("ComponentView");		}				public function set transitionOnType(value:String):void		{			_transitionOnType = value;		}		public function set transitionOffType(value:String):void		{			_transitionOffType = value;		}		public function get transitionActive():Boolean		{			return _transitionActive;		}				// this state is for the general main state of the view.  		public function get finiteState():String		{			if (_transitionActive)			{				return IN_TRANSITION;			}			else if (cleanedUp || disabled)			{				return DISABLED;			}			else			{				return ENABLED;			}		}				// this state is for the concrete states of the concrete view.		public function get state():String		{			return _state;		}				public function init(aModel:Model, aController:Controller, aStage:DisplayObjectContainer, aParentView:CompositeView):void 		{			model = aModel;			controller = aController;			targetStage_mc = aStage;			parentView = aParentView;						disabled = false;						initInternal();		}				protected function initInternal():void		{			_transitionActive = true;			intro();		}				protected function intro():void		{			introTransitionComplete();		}				protected function introTransitionComplete():void		{			_transitionActive = false;			enable();			dispatchEvent(new Event(INTRO_COMPLETED));		}				public function enable():void		{			disabled = false;		}				public function perform(task:String, view:ComponentView, object:Object = null):Object		{			if (view == this)			{				throw new Error("This view has attempted to call its own perform method!");			}			else			{				throw new Error("An unidentified caller has attempted to call perform in this ComponentView, or the task param was not recognized!");			}		}				// ABSTRACT METHOD (must be overridden in a subclass)		protected function addView(c:ComponentView):void 		{			// no default			throw new IllegalOperationError("addView operation not supported");		}				// ABSTRACT METHOD (must be overridden in a subclass)		protected function removeView(c:ComponentView):void 		{			throw new IllegalOperationError("removeView operation not supported");		}				// ABSTRACT METHOD (must be overridden in a subclass)		public function modelUpdate(event:Event):void 		{			throw new IllegalOperationError("updateModel method missing");		}				public function disable():void 		{			disabled = true;			removeEvents();		}				// ABSTRACT METHOD (must be overridden in a subclass)		protected function removeEvents():void 		{			throw new IllegalOperationError("removeEvents method missing");		}				protected function outro():void		{			outroTransitionComplete();		}				protected function outroTransitionComplete():void		{			_transitionActive = false;			cleanUp();			dispatchEvent(new Event(OUTRO_COMPLETED));		}				protected function cleanUp():void		{			_transitionActive = false;			// remove this view/object			RemoveChildren.removeAChild(this.parent, this);			parentView.deleteView(this);						// remove MVC			model = null;			controller = null;			targetStage_mc = null;			parentView = null;						dispatchEvent(new Event(DISPOSED));		}				public function dispose():void 		{			disabled = true;			if (!cleanedUp)			{				cleanedUp = true;								removeEvents();								_transitionActive = true;				outro();			}		}	}}