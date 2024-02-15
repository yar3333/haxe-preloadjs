package createjs;

/**
 * A loader for Text files.
 */
@:native('createjs.TextLoader')
extern class TextLoader extends AbstractLoader
{
	function new(loadItem:Dynamic) : Void;

	/**
	 * Determines if the loader can load a specific item. This loader loads items that are of type {{#crossLink "Types/TEXT:property"}}{{/crossLink}},
	 * but is also the default loader if a file type can not be determined.
	 */
	static function canLoadItem(item:Dynamic) : Bool;
}