package preloadjs.loaders;

/**
 * A loader for SVG files.
 */
@:native('createjs.SVGLoader')
extern class SVGLoader extends AbstractLoader
{
	function new(loadItem:Dynamic, preferXHR:Bool) : Void;

	/**
	 * Determines if the loader can load a specific item. This loader can only load items that are of type
	 * {{#crossLink "Types/SVG:property"}}{{/crossLink}}
	 */
	static function canLoadItem(item:Dynamic) : Bool;
}