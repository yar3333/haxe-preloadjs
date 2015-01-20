package createjs;
import js.html.Document;

/**
 * A few data utilities for formatting different data types.
 */
extern class DataUtils
{
	/**
	 * Parse XML using the DOM. This is required when preloading XML or SVG.
	 */
	static function parseXML(text:String, type:String) : js.html.Document;
	/**
	 * Parse a string into an Object.
	 */
	function parseJSON(value:String) : Dynamic;
}