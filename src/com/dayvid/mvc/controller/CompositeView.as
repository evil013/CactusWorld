﻿package com.dayvid.mvc.controller {	import flash.errors.IllegalOperationError;	import flash.events.Event;	import com.dayvid.mvc.composite_view.ComponentView;
		// ABSTRACT CLASS (should be subclassed and not instantiated)	public class CompositeView extends ComponentView 	{		private var thisHasOutro:Boolean = true;		private var childrenViews:Vector.<ComponentView> = new Vector.<ComponentView>();				public function CompositeView()		{			super ();		}				override protected function addView(c:ComponentView):void 		{			// make sure that this new view is not already added			var index:int = childrenViews.indexOf(c);			if (index < 0)			{				childrenViews.push(c);			}			else			{				throw new Error("Attempted to add a ComponentView via addView that was already in the childrenViews array!");			}		}				public function closeAView(view:ComponentView, next:Boolean = true):void		{			throw new Error("An unidentified caller has attempted to call closeView!");		}				public function deleteView(aView:ComponentView):void 		{			removeView(aView);		}				override protected function removeView(c:ComponentView):void 		{			var index:int = childrenViews.indexOf(c);			if (index > -1) 			{				childrenViews.splice(index, 1);								if (childrenViews.length <= 0 && cleanedUp && !thisHasOutro)				{					cleanUp();				}			}		}				protected function removeAllViews():void 		{						var tempArray:Vector.<ComponentView> = childrenViews.slice(0);			for (var i:uint = 0; i < tempArray.length; i++) tempArray[i].dispose();		}				protected function setupAView(aView:ComponentView):void 		{			addView(aView);		}				override public function modelUpdate(event:Event):void 		{			for each (var c:ComponentView in childrenViews) 			{				c.modelUpdate(event);			}		}				override protected function outro():void		{			// polymorph and don't call super.outro() is this CompositeView has an outro			thisHasOutro = false;			if (childrenViews.length > 0)			{				/*				if outro() is not polymorphed, then we need to first cleanUp all views and let them call deleteView.				cleanUpInternal is then called after all views have been removed. 				Incase any child views have an outro.				*/				removeAllViews();			}			else			{				super.outro();			}		}				override protected function cleanUp():void		{			if (childrenViews.length > 0)			{				removeAllViews();			}						super.cleanUp();		}				override public function dispose():void		{			super.dispose();		}	}}