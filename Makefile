OPTIONS+= -src out/data.json
OPTIONS+= --remove-path-prefix native/src
OPTIONS+= --native-package createjs
OPTIONS+= --apply-native-package

OPTIONS+= -ifile preloadjs/version.js
OPTIONS+= -ifile createjs/utils/indexOf.js 
OPTIONS+= -ifile createjs/utils/extend.js 
OPTIONS+= -ifile createjs/utils/promote.js 
OPTIONS+= -ifile createjs/utils/BrowserDetect.js
OPTIONS+= -ifile createjs/utils/definePropertySupported.js
OPTIONS+= -ifile createjs/utils/proxy.js

OPTIONS+= --type-map XML-js.html.Document
OPTIONS+= --type-map RegExp-Dynamic

OPTIONS+= --specify-type LoadQueue.registerLoader.The-AbstractLoader
OPTIONS+= --specify-type LoadQueue.unregisterLoader.loader-AbstractLoader

convert:
	yuidoc -p -o out native/src
	haxelib run yuidoc2haxe $(OPTIONS) library
	rm -r out
