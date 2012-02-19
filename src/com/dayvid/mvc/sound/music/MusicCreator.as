package com.dayvid.mvc.sound.music
{
	import com.dayvid.mvc.model.model_components.OptionsSettings;
	
	import com.dayvid.mvc.sound.music.music_components.Music;
	
	import flash.errors.IllegalOperationError;
	
	public class MusicCreator
	{
		protected var model:OptionsSettings
		protected var _playDelete:Boolean = false;
		
		public function MusicCreator(aModel:OptionsSettings) 
		{
			model = aModel;
		}
		
		public function get playDelete():Boolean
		{
			return _playDelete;
		}
		
		public function createMusic(aType:uint):Music 
		{
			_playDelete = false;
			
			return new Music(model, createSound(aType));
		}
		
		// TO DO if trying to do a random loop, but can't use event listener, it causes a gap.
		// create intro
		// create main (vector)
		// create outro
		protected function createSound (aType:uint):Class 
		{
			throw new Error("Invalid kind of Music specified");
			return null;
		}
	}
}