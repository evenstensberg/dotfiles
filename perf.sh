#!/usr/bin/env bash

#runs a performance benchmark on a given file (script/test.js)

T="$(date +%s)"
cd esm
npm run test
T="$(($(date +%s)-T))"

npm install --save v8-compile-cache
ex -sc '2i|require("v8-compile-cache")' -cx script/test.js
T2="$(date +%s)"
npm run test
T2="$(($(date +%s)-T2))"

npm uninstall v8-compile-cache
ex -sc '2d' -cx script/test.js
rm -rf node_modules
npm install
echo "Without V8: (secs) ${T}"
echo "With V8: (secs) ${T2}"