# grunt-xmllint

> Grunt plugin for running [xmllint](http://xmlsoft.org/).

_This plugin is developed for Grunt `0.4.0` and is not tested for backward compatibility with Grunt `0.3.x`._

## Getting Started

1. Install this grunt plugin with the follwing command:

```shell
npm install grunt-xmllint --save-dev
```

2. [Install xmllint](http://xmlsoft.org/)

3. Add this to your project's `Gruntfile.js`:

```js
grunt.loadNpmTasks('grunt-xmllint');
```

## xmllint task

_Run this task with the `grunt xmllint` command._

_This task is a [multi task][] so any targets, files and options should be specified according to the [multi task][] documentation._

[multi task]: https://github.com/gruntjs/grunt/wiki/Configuring-tasks

### Usage Example

```js
xmllint: {
  application: {
	  dir: 'application'
	},
	options: {
		suffixes: [
			'xml',
			'xlf'
		]
	}
}
```

### Target Properties
#### dir
Type: `String`

The file or directory where xmllint should search for files.

### Options
#### bin
Type: `String`
Default: `'xmllint'`

The binary name if it is in your PATH or the full path if not.

#### suffixes
Type: `Array`
Default: `['xml']`

#### verbose
Type: `Boolean`
Default: `false`

All output is surpressed (redirected to `/dev/null`) by default.

#### maxBuffer
Type: `Number`
Default: `200*1024`

Override the maxBuffer-Size of nodejs's exec() function if you expect a long output on stdout.
