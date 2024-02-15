package createjs;

/**
 * A loader for CSS files.
 */
@:native('createjs.XMLLoader')
extern class XMLLoader extends AbstractLoader
{
	function new(loadItem:Dynamic) : Void;

	/**
	 * Determines if the loader can load a specific item. This loader can only load items that are of type
	 * {{#crossLink "Types/XML:property"}}{{/crossLink}}.
	 */
	static function canLoadItem(item:Dynamic) : Bool;
}