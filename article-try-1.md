Module Loaders: Why you need them, How they work, and How to write a plugin
This article is for developers who want to dig into Module Loaders. We will look at how module loaders work, what are the stages of the pipeline and how they could be intervened.

In this article you will learn about how Module Loaders work, look at how the loading process could be extended, and implement a plugin for StealJS.
Intro
The nature of a human brain is that it cannot deal with a lot of objects at the same time [1]. If you build large JavaScript applications you should definitely consider this limitation.

Modules is a way to organize your application. A module could be seen as a black box with a clear and preferably simple API. It is common that modules can depend on other modules.

For modern front-end development there are the following standards available for you to work with modules:
AMD;
CommonJS;
ES6.

They have different but very similar APIs because they serve the following most basic tasks:
define a module;
load a module.

In this article we will skip the 1st task since there is a lot of articles in the Internet about it. Instead we will focus on how a module can be loaded.
Module Loader
The tool that performs a loading module task is called... Module Loader. In old days the most common way to have a module was to create a JavaScript file that creates a global variable, and load this file into a browser with a regular script tag. So, there was no need in this tool.

The complications start when you have to deal with a lot of modules. What could happen in this case? The most obvious problems are:
a name collision. Especially, if you use an external modules that you don’t actually control. You never know what one can pollute the global namespace with.
a wrong order of modules being loaded;
circular dependencies.

So, a module loader helps to simplify the process of working with modules. You can focus on development and you only need to know what modules do you need for the one you are working on right now.

It also acts as a dependency manager and maintains a module registry [3].
Loader Pipeline
Lets look at the standards first.

Current draft of [ECMA-262](https://tc39.github.io/ecma262/) does not have the specificationf for module loader since it was removed in 2014. You can still find it in the [archive](http://wiki.ecmascript.org/doku.php?id=harmony:specification_drafts#august_24_2014_draft_rev_27). The new draft by WHATWG is not completed yet.

The specification for the module loader was removed from the ES6/ES2015 specification in 2014 and transferred to WHATWG. It’s not completed yet, but here is what we can get from it + looking up the archive.

Here is how the specification describes what a module loader should do [2]:

The JavaScript Loader allows host environments, like Node.js and browsers, to fetch and load modules on demand. It provides a hookable pipeline, to allow front-end packaging solutions like Browserify, WebPack and jspm to hook into the loading process.


Loader is a system for loading and executing modules, and there is a way to participate in the process. There are several Loader’s hooks which are called at various points in the process of loading a module. The default hooks are implemented on the Loader.prototype, and thus could be overridden/extended.

These are the available hooks:
Normalize - given  (name, referrerName, referrerAddress) returns a normalized module name. This string is used in the module registry as module identifier.
Locate - is called immediately after normalize (unless the module is already loaded or loading) with loadRequest object which name property is a normalized module name, and it eventually returns a resource address.
Fetch - fetching the requested module (e.g. from a filesystem or network). This hook is called with LoadRequest object with address property, and returns an eventual String containing the source code of the module.
translate - translating the fetched source (as via a preprocessor or compiler). It is called with LoadRequest with source property which is a result of the fetch. The purpose of this hook is to translate the source code from another programming language into ECMAScript.
instantiate - instantiating the translated source.

Before a module could be fetched, loader needs to figure out its location. For this there are two additional stages:
Normalize
locate

A result of each stage is a promise that if resolved successfully
Links
https://en.wikipedia.org/wiki/The_Magical_Number_Seven,_Plus_or_Minus_Two
https://whatwg.github.io/loader/#module-loading
http://code.matthewphillips.info/modules-in-the-browser/#/4
https://github.com/ModuleLoader/es6-module-loader
https://github.com/ModuleLoader/es6-module-loader/blob/master/docs/loader-extensions.md




