﻿package com.dayvid.mvc.sound.soundfx{	import common.sfxfactory.sfx_components.SoundFX;	//	public class SoundFXManager	{		private var sndType:uint;		private var sfxPlayer:SoundFXPlayer;		private var sndFXArray:Array = new Array();		//		public function SoundFXManager(aSndType:uint, aSfxPlayer:SoundFXPlayer) 		{			sndType = aSndType;			sfxPlayer = aSfxPlayer;		}		//		public function playSFX(thisObject:Object = null):void 		{			var sndFX:SoundFX = sfxPlayer.createSFX(sndType);			sndFXArray.push(sndFX)			sndFX.playSFX(thisObject);		}		//		public function cleanUpAllSFX():void 		{			if (sndFXArray.length > 0)			{				for (var i:uint  = 0; i < sndFXArray.length; i++)				{					sndFXArray[i].cleanUp();				}			}			sndFXArray.length = 0;		}				public function stopAllSFX():void 		{			if (sndFXArray.length > 0)			{				for (var i:uint  = 0; i < sndFXArray.length; i++)				{					sndFXArray[i].stopSFX();				}			}			sndFXArray.length = 0;		}		//		public function cleanUp():void		{			cleanUpAllSFX();			sfxPlayer = null;		}	}}