﻿package views{	import com.dayvid.mvc.composite_view.ComponentView;	import com.dayvid.mvc.composite_view.CompositeView;			import com.dayvid.mvc.controller.TransitionTypes;	import flash.events.Event;	import flash.events.MouseEvent;	public class PlayView extends CompositeView	{		private var playToolView:PlayToolView;   		private var playMapView:PlayMapView;   		private var playHelpView:PlayHelpView;   		private var playCollectionView:PlayCollectionView;   		private var playSetView:PlaySetView;		   		private var isoTest:IsoTest;				public function PlayView()		{			trace("[PlayView]");			super();			_transitionOnType = TransitionTypes.FADE_IN;			_transitionOffType = TransitionTypes.FADE_OUT;		}		/********************************************************************************************************************************		 * Init and Intro Methods - Inherited methods		 ********************************************************************************************************************************/		override protected function initInternal():void		{			// call super.initInternal(); after setting up this view			//***********			openPlayToolView();						super.initInternal();		}		override protected function intro():void		{			controller.viewTransition(this, introTransitionComplete, _transitionOnType);		}		override protected function introTransitionComplete():void		{			// if using an intro, set event listeners here.  And anything else relevant.			super.introTransitionComplete();		}		override public function enable():void		{			// this method is intended to be called after the disable method is called			// add events, or anything else to enable this view.			quitS_btn.addEventListener(MouseEvent.MOUSE_UP, quitSBtnUp);			super.enable();		}		/********************************************************************************************************************************		 * Concrete methods unique to this view		 ********************************************************************************************************************************/		private function quitSBtnUp(event:MouseEvent):void		{			this.parentView.closeAView(this, true);		}		private function openPlayToolView():void		{			playToolView = new PlayToolView();			setupAView(playToolView);		}		private function closePlayToolView():void		{			playToolView.dispose();			playToolView = null;		}		private function openPlayMapView():void		{			if (playMapView == null)			{				playMapView = new PlayMapView();				setupAView(playMapView);			}		}		private function closePlayMapView():void		{			if (playMapView != null)			{				playMapView.dispose();				playMapView = null;			}		}		private function openPlayHelpView():void		{			if (playHelpView == null)			{				playHelpView = new PlayHelpView();				setupAView(playHelpView);			}		}		private function closePlayHelpView():void		{			if (playHelpView != null)			{				playHelpView.dispose();				playHelpView = null;			}		}				private function openPlayCollectionView():void		{			if (playCollectionView == null)			{				playCollectionView = new PlayCollectionView();				setupAView(playCollectionView);			}		}		private function closePlayCollectionView():void		{			if (playCollectionView != null)			{				playCollectionView.dispose();				playCollectionView = null;			}		}				private function openPlaySetView():void		{			if (playSetView == null)			{				playSetView = new PlaySetView();				setupAView(playSetView);			}		}		private function closePlaySetView():void		{			if (playSetView != null)			{				playSetView.dispose();				playSetView = null;			}		}				/********************************************************************************************************************************		 * Setting up Child Views - Inherited methods		 ********************************************************************************************************************************/		override protected function setupAView(aView:ComponentView):void		{			super.setupAView(aView);			addChild(aView);			aView.init(model, controller, targetStage_mc, this);		}		//*********		/********************************************************************************************************************************		 * Methods inherited from the super class and part of the MVC View interface		 ********************************************************************************************************************************/		override public function perform(task:String, view:ComponentView, object:Object = null):Object		{			if (task == "map")			{				// do something				trace("[SelectNaviView] perform PlayMapView");								if(	playMapView!=null)				{					closePlayMapView();				}				else				{					openPlayMapView();				}			}			else if (task == "help")			{				// do something				trace("[SelectNaviView] perform PlayHelpView");				if(	playHelpView!=null)				{					closePlayHelpView();				}				else				{					openPlayHelpView();				}			}						else if (task == "collection")			{				// do something				trace("[SelectNaviView] perform PlayCollectionView");				if(	playCollectionView!=null)				{					closePlayCollectionView();				}				else				{					openPlayCollectionView();				}						}			else if (task == "set")			{				// do something				trace("[SelectNaviView] perform PlaySetView");				if(	playSetView!=null)				{					closePlaySetView();				}				else				{					openPlaySetView();				}						}			else			{				super.perform(task, view, object);			}						// send an Object by default, use this to return anything to the caller			return new Object();		}		//*********		override public function closeAView(view:ComponentView, next:Boolean = true):void		{			super.closeAView(view, next);					}		//*********		override public function modelUpdate(event:Event):void		{			// get data from model and update view			//trace ("PlayView model update");			//trace("model.whatUpdated: " + model.whatUpdated);		}		/********************************************************************************************************************************		 * Clean up and Outros - Inherited methods		 ********************************************************************************************************************************/		override public function disable():void		{			super.disable();		}		override protected function removeEvents():void		{			quitS_btn.removeEventListener(MouseEvent.MOUSE_UP, quitSBtnUp);		}		override protected function outro():void		{			controller.viewTransition(this, outroTransitionComplete, _transitionOffType);		}		override protected function outroTransitionComplete():void		{			super.outroTransitionComplete();		}		override protected function cleanUp():void		{			// remove display objects			// clear arrays, objects and vectors			super.cleanUp();		}		override public function dispose():void		{			//trace("cleanUp PlayView");			// clean up anything that needs to be cleaned up at the point of calling cleanUp.  Ex: states in the model.			super.dispose();		}	}}