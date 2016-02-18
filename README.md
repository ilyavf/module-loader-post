# steal-plugin
Create a plugin for StealJS and write a blog post about Module Loaders


Plan:
- learn ES6 Module Loader Polyfill
- try and learn SystemJS
- write CoffeeScript plugin


## Links and Notes

- Articles, slides and github:
 - http://code.matthewphillips.info/modules-in-the-browser/
 - http://code.matthewphillips.info/system-plugins/#/
 - https://github.com/matthewp/modules-in-the-browser
 - http://slides.com/matthewphillips/steal-advanced#/3
 - http://zetafleet.com/blog/2015/12/practical-module-loader-design.html

- Research links:
 - https://hacks.mozilla.org/2015/08/es6-in-depth-modules/
 - http://www.2ality.com/2015/04/webpack-es6.html
 - http://webpack.github.io/docs/code-splitting.html
 - https://whatwg.github.io/loader/
   - https://whatwg.github.io/loader/#sec-properties-of-the-loader-prototype-object
   - https://whatwg.github.io/loader/#module-status

- ES6 Module Loader Polyfill

 - https://github.com/ModuleLoader/es6-module-loader
    Provides an asynchronous loader (System.import) to dynamically load ES6 modules.
    Supports Traceur, Babel and TypeScript for compiling ES6 modules and syntax into ES5 in the browser with source map support.

 - https://github.com/ModuleLoader/es6-module-loader/blob/master/docs/loader-extensions.md#extending-the-es6-loader
    Extending the ES6 Loader

    The loader pipeline is based on the following hooks:

    Normalize: Given the import name, provide the normalized name for the resource.
    Locate: Given a normalized module name, provide the URL for the resource.
    Fetch: Given a URL for a resource, fetch its content.
    Translate: Given module source, make any source modifications.
    Instantiate: Given module source, determine its dependencies, and how to execute it.

    Override:
    https://github.com/ModuleLoader/es6-module-loader/blob/master/src/loader.js#L798

- SystemJS Universal dynamic module loader
 - https://github.com/systemjs/systemjs
    This is an example of a universal module loader based on _ES6 Module Loader Polyfill_ for loading AMD, CommonJS and globals.

- StealJS
 - http://blog.bitovi.com/introducing-stealjs/
 - http://stealjs.com/docs/guides.Contributing.html#section_Understandingsteal_scode


- StealJS Plugins on NPM:
 - https://www.npmjs.com/package/steal-jsx
 - https://www.npmjs.com/package/steal-sass
 - https://www.npmjs.com/package/steal-sweet
 - https://www.npmjs.com/package/steal-template
 - https://www.npmjs.com/package/steal-less
 - https://www.npmjs.com/package/steal-css