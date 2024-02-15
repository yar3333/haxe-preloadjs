package preloadjs.net;

import js.html.VideoElement;
import js.html.AudioElement;
import haxe.extern.EitherType;
import preloadjs.data.LoadItem;

/**
 * An {{#crossLink "TagRequest"}}{{/crossLink}} that loads HTML tags for video and audio.
 */
@:native('createjs.MediaTagRequest')
extern class MediaTagRequest extends TagRequest
{
	function new(loadItem:LoadItem, tag:EitherType<AudioElement, VideoElement>, srcAttribute:String) : Void;
}