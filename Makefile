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

#OPTIONS+= --type-map RegExp-Dynamic

convert:
	yuidoc -p -o out native/src
	haxelib run yuidoc2haxe $(OPTIONS) library
	rm -r out
	haxelib run refactor process library *.hx postprocess.rules
