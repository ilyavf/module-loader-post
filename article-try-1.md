Module Loaders: Why you need them, How they work, and How to write a plugin

In this article you will learn about how Module Loaders work, look at how the loading process could be extended, and implement a plugin for StealJS.

Intro
The nature of a human brain is that it cannot deal with a lot of objects at the same time [1]. If you build large JavaScript applications you should definitely consider this limitation.

Modules is a way to organize your application. It could be seen as a black box with a clear and preferably simple API. It is common that modules can depend on other modules.

For modern front-end development there are the following standards available for you to work with modules:
AMD;
CommonJS;
ES6.

They have different but very similar APIs because they serve the following most basic tasks:
to define a module;
to load a module.

In this article we will skip the 1st task since there is a lot of articles in the Internet about it. Instead we will focus on how a module can be loaded.
Module Loader
The tool that performs a module load task is called Module Loader. In old days the most common way to have a module is to create a JavaScript file that creates a global variable, and load this file into a browser with a regular script tag. So, there was no need in this tool.

The complications start when you have to deal with a lot of modules. What could happen in this case? The most obvious problems are:
a name collision. Especially, if you use an external modules that you don’t actually control. You never know what one can pollute the global namespace with.
a wrong order of module loads;
circular dependencies.

So, a module loader targets to simplify the process.
Loader Pipeline
Let’s see now how the standards describe what a load module should do.
Links

https://en.wikipedia.org/wiki/The_Magical_Number_Seven,_Plus_or_Minus_Two
