﻿package com.dayvid.mvc.model.model_components {	public class GameInfo extends Dispatch 	{		private var _panWidth:Number;		private var _soundFXDistanceFadeStartPoint:Number = 0;		private var _soundFXFadeRange:Number = 100;		private var _movieWidth:Number;		private var _movieHeight:Number;				public function GameInfo() 		{			//trace("GameInfo");			super();						_movieWidth = this._targetStage_mc.stage.stageWidth;			_movieHeight = this._targetStage_mc.stage.stageHeight;		}				public function get movieWidth():Number		{			return 	_movieWidth;		}		public function set movieWidth(value:Number):void		{			_movieWidth = value;		}				public function get movieHeight():Number		{			return _movieHeight;		}		public function set movieHeight(value:Number):void		{			_movieHeight = value;		}				public function get panWidth():Number		{			return _panWidth;		}		public function set panWidth(value:Number):void		{			_panWidth = value;		}				public function get soundFXDistanceFadeStartPoint():Number		{			return _soundFXDistanceFadeStartPoint;		}		public function set soundFXDistanceFadeStartPoint(value:Number):void		{			_soundFXDistanceFadeStartPoint = value;		}				public function get soundFXFadeRange():Number		{			return _soundFXFadeRange;		}		public function set soundFXFadeRange(value:Number):void		{			_soundFXFadeRange = value;		}	}}