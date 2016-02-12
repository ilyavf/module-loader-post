# Module Loaders: Why you need them, How they work, and How to write a plugin

*This article is for developers who want to dig into Module Loaders. We will look at how module loaders work,
what are the stages of the pipeline and how they could be intervened.*

## Contents
@@TOC@@


## Intro

### What is a Module and why there is a need for Module Loaders

### What are the options (without a deep comparison, almost just a list)

What we don't like:
- Usually requires configuration of where modules are located.
- Wrapping code into module loader helper (e.g. define)
 - remember that having no wrapper means pre-compilation.

What we like:
- do not care about external module location

Standards:
- CommonJS (nodejs, browserify, webpack)
- ES6
 - static loading

Libraries:
- webpack
 - supports dynamic loading (http://webpack.github.io/docs/code-splitting.html)

## Loader pipeline

https://whatwg.github.io/loader/#module-status

Stages of pipeline:
- "fetch"
- "translate"
- "instantiate"

https://whatwg.github.io/loader/#module-status-UpgradeToStage

An *stage* is a record with the following fields:

|Internal Slot	|Value Type (non-normative)	            |Description (non-normative)
|---|---|---
|[[Stage]]	    |"fetch", "translate", "instantiate"	|A constant value to indicating which phase the entry is at.
|[[Result]]	    |Promise or undefined	                |A promise for the stage entry.

Each [[Stage]] value indicates the currently pending operation. If the [[Result]] field is *undefined*, the operation has not been initiated; if the [[Result]] field is a promise, the operation has been initiated but not completed. Once a stage completes, its Stage Entry is removed from the pipeline. The following table describes the intended purpose of each stage of the pipeline:

|Value	|Description (non-normative)
|-------|-------
|"fetch"	    |fetching the requested module (e.g. from a filesystem or network)
|"translate"	|translating the fetched source (as via a preprocessor or compiler)
|"instantiate"	|instantiating the translated source as a Module Record

https://whatwg.github.io/loader/#linking

DependencyGraph

Full pipeline: (http://code.matthewphillips.info/modules-in-the-browser/#/5/4)

normalize -> locate -> fetch -> translate -> instantiate

```
import math from "./math";
normalize: ./math -> utils/math
locate: utils/math -> http://example.com/utils/math.js
fetch: http://... -> "export function add(a, b){ ... "
translate: "export function .." -> "export function .."
instantiate: "export function .." -> { deps: [], execute: fn }
```

### Explain what is happening during every step (normalize, locate, fetch, translate, instantiate)

### Explain hooks for extending the loading process (on System Loader example)

### See if different module loaders are similar/different, and how they could be extended.

## Loader Plugin (compact, just to show that it is simple) - specific to StealJS

### Code samples for StealJS plugin

### How other Module Loaders can be extended

