#!/usr/bin/env node

// example from https://www.npmjs.com/package/r-script

var Rscript = require("r-script");
 
var out = Rscript("ex-sync.R")
  .data("hello world", 20)
  .callSync();
  
console.log(out);

// ---

var attitude = JSON.parse(require("fs").readFileSync("attitude.json", "utf8"));

Rscript("ex-async.R")
  .data({df: attitude, nGroups: 3, fxn: "mean" })
  .call(function(err, d) {
    if (err) throw err;
    console.log(d);
  });
