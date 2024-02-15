package preloadjs.loaders;

import preloadjs.data.Types;

/**
 * The AbstractMediaLoader is a base class that handles some of the shared methods and properties of loaders that
 * handle HTML media elements, such as Video and Audio.
 */
@:native('createjs.AbstractMediaLoader')
extern class AbstractMediaLoader extends AbstractLoader
{
	function new(loadItem:Dynamic, preferXHR:Bool, type:Types) : Void;
}