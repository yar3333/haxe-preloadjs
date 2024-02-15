package createjs;

typedef AbstractLoaderLoadstartEvent =
{
	var target : Dynamic;
	var type : String;
}

typedef AbstractLoaderCompleteEvent =
{
	var target : Dynamic;
	var type : String;
}

typedef AbstractLoaderFileerrorEvent =
{
	var target : Dynamic;
	var type : String;
	var The : Dynamic;
}

typedef AbstractLoaderFileloadEvent =
{
	var target : Dynamic;
	var type : String;
	var item : Dynamic;
	var result : Dynamic;
	var rawResult : Dynamic;
}

typedef AbstractLoaderInitializeEvent =
{
	var target : Dynamic;
	var type : String;
	var loader : AbstractLoader;
}

/**
 * The base loader, which defines all the generic methods, properties, and events. All loaders extend this class,
 * including the {{#crossLink "LoadQueue"}}{{/crossLink}}.
 */
@:native('createjs.AbstractLoader')
extern class AbstractLoader extends EventDispatcher
{
	/**
	 * If the loader has completed loading. This provides a quick check, but also ensures that the different approaches
	 * used for loading do not pile up resulting in more than one `complete` {{#crossLink "Event"}}{{/crossLink}}.
	 */
	var loaded : Bool;
	/**
	 * Determine if the loader was canceled. Canceled loads will not fire complete events. Note that this property
	 * is readonly, so {{#crossLink "LoadQueue"}}{{/crossLink}} queues should be closed using {{#crossLink "LoadQueue/close"}}{{/crossLink}}
	 * instead.
	 */
	var canceled : Bool;
	/**
	 * The current load progress (percentage) for this item. This will be a number between 0 and 1.
	 * 
	 * <h4>Example</h4>
	 * 
	 *     var queue = new createjs.LoadQueue();
	 *     queue.loadFile("largeImage.png");
	 *     queue.on("progress", function() {
	 *         console.log("Progress:", queue.progress, event.progress);
	 *     });
	 */
	var progress : Float;
	/**
	 * The type of item this loader will load. See {{#crossLink "AbstractLoader"}}{{/crossLink}} for a full list of
	 * supported types.
	 */
	var type : Types;
	/**
	 * A custom result formatter function, which is called just before a request dispatches its complete event. Most
	 * loader types already have an internal formatter, but this can be user-overridden for custom formatting. The
	 * formatted result will be available on Loaders using {{#crossLink "getResult"}}{{/crossLink}}, and passing `true`.
	 */
	var resultFormatter : Dynamic;

	/**
	 * Get a reference to the manifest item that is loaded by this loader. In some cases this will be the value that was
	 * passed into {{#crossLink "LoadQueue"}}{{/crossLink}} using {{#crossLink "LoadQueue/loadFile"}}{{/crossLink}} or
	 * {{#crossLink "LoadQueue/loadManifest"}}{{/crossLink}}. However if only a String path was passed in, then it will
	 * be a {{#crossLink "LoadItem"}}{{/crossLink}}.
	 */
	function getItem(?value:String) : Dynamic;
	/**
	 * Get a reference to the content that was loaded by the loader (only available after the {{#crossLink "complete:event"}}{{/crossLink}}
	 * event is dispatched.
	 */
	function getResult(?raw:Dynamic, ?rawResult:Bool) : Dynamic;
	/**
	 * Return the `tag` this object creates or uses for loading.
	 */
	function getTag() : Dynamic;
	/**
	 * Set the `tag` this item uses for loading.
	 */
	function setTag(tag:Dynamic) : Void;
	/**
	 * Begin loading the item. This method is required when using a loader by itself.
	 * 
	 * <h4>Example</h4>
	 * 
	 *      var queue = new createjs.LoadQueue();
	 *      queue.on("complete", handleComplete);
	 *      queue.loadManifest(fileArray, false); // Note the 2nd argument that tells the queue not to start loading yet
	 *      queue.load();
	 */
	function load() : Void;
	/**
	 * Close the the item. This will stop any open requests (although downloads using HTML tags may still continue in
	 * the background), but events will not longer be dispatched.
	 */
	function cancel() : Void;
	/**
	 * Clean up the loader.
	 */
	function destroy() : Void;
	/**
	 * Get any items loaded internally by the loader. The enables loaders such as {{#crossLink "ManifestLoader"}}{{/crossLink}}
	 * to expose items it loads internally.
	 */
	function getLoadedItems() : Array<Dynamic>;
	override function toString() : String;

	/**
	 * The {{#crossLink "ProgressEvent"}}{{/crossLink}} that is fired when the overall progress changes. Prior to
	 * version 0.6.0, this was just a regular {{#crossLink "Event"}}{{/crossLink}}.
	 */
	inline function addProgressEventListener(handler:Dynamic->Void, ?useCapture:Bool) : Dynamic return addEventListener("progress", handler, useCapture);
	inline function removeProgressEventListener(handler:Dynamic->Void, ?useCapture:Bool) : Void removeEventListener("progress", handler, useCapture);
	/**
	 * The {{#crossLink "Event"}}{{/crossLink}} that is fired when a load starts.
	 */
	inline function addLoadstartEventListener(handler:AbstractLoaderLoadstartEvent->Void, ?useCapture:Bool) : Dynamic return addEventListener("loadstart", handler, useCapture);
	inline function removeLoadstartEventListener(handler:AbstractLoaderLoadstartEvent->Void, ?useCapture:Bool) : Void removeEventListener("loadstart", handler, useCapture);
	/**
	 * The {{#crossLink "Event"}}{{/crossLink}} that is fired when the entire queue has been loaded.
	 */
	inline function addCompleteEventListener(handler:AbstractLoaderCompleteEvent->Void, ?useCapture:Bool) : Dynamic return addEventListener("complete", handler, useCapture);
	inline function removeCompleteEventListener(handler:AbstractLoaderCompleteEvent->Void, ?useCapture:Bool) : Void removeEventListener("complete", handler, useCapture);
	/**
	 * The {{#crossLink "ErrorEvent"}}{{/crossLink}} that is fired when the loader encounters an error. If the error was
	 * encountered by a file, the event will contain the item that caused the error. Prior to version 0.6.0, this was
	 * just a regular {{#crossLink "Event"}}{{/crossLink}}.
	 */
	inline function addErrorEventListener(handler:Dynamic->Void, ?useCapture:Bool) : Dynamic return addEventListener("error", handler, useCapture);
	inline function removeErrorEventListener(handler:Dynamic->Void, ?useCapture:Bool) : Void removeEventListener("error", handler, useCapture);
	/**
	 * The {{#crossLink "Event"}}{{/crossLink}} that is fired when the loader encounters an internal file load error.
	 * This enables loaders to maintain internal queues, and surface file load errors.
	 */
	inline function addFileerrorEventListener(handler:AbstractLoaderFileerrorEvent->Void, ?useCapture:Bool) : Dynamic return addEventListener("fileerror", handler, useCapture);
	inline function removeFileerrorEventListener(handler:AbstractLoaderFileerrorEvent->Void, ?useCapture:Bool) : Void removeEventListener("fileerror", handler, useCapture);
	/**
	 * The {{#crossLink "Event"}}{{/crossLink}} that is fired when a loader internally loads a file. This enables
	 * loaders such as {{#crossLink "ManifestLoader"}}{{/crossLink}} to maintain internal {{#crossLink "LoadQueue"}}{{/crossLink}}s
	 * and notify when they have loaded a file. The {{#crossLink "LoadQueue"}}{{/crossLink}} class dispatches a
	 * slightly different {{#crossLink "LoadQueue/fileload:event"}}{{/crossLink}} event.
	 */
	inline function addFileloadEventListener(handler:AbstractLoaderFileloadEvent->Void, ?useCapture:Bool) : Dynamic return addEventListener("fileload", handler, useCapture);
	inline function removeFileloadEventListener(handler:AbstractLoaderFileloadEvent->Void, ?useCapture:Bool) : Void removeEventListener("fileload", handler, useCapture);
	/**
	 * The {{#crossLink "Event"}}{{/crossLink}} that is fired after the internal request is created, but before a load.
	 * This allows updates to the loader for specific loading needs, such as binary or XHR image loading.
	 */
	inline function addInitializeEventListener(handler:AbstractLoaderInitializeEvent->Void, ?useCapture:Bool) : Dynamic return addEventListener("initialize", handler, useCapture);
	inline function removeInitializeEventListener(handler:AbstractLoaderInitializeEvent->Void, ?useCapture:Bool) : Void removeEventListener("initialize", handler, useCapture);
}