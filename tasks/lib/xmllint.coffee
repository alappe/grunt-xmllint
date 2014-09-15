###
grunt-xmllint

Copyright (c) 2014 Andreas Lappe
http://zimmer7.com
Licensed under the BSD license.
###

path = require 'path'
exec = (require 'child_process').exec

exports.init = (grunt) ->

  exports = config = {}
  cmd = done = null
  defaults =
    bin: 'xmllint'
    suffixes: ['xml']
    verbose: false
    maxBuffer: 200*1024

  buildCommand = (dir) ->
    suffixes = for suffix in config.suffixes
      "-name *.#{suffix}"
    linuxFlag = if process.platform is 'linux' then '-r ' else ''
    cmd = "find #{dir}"
    cmd += " #{suffixes.join ' -o '}"
    cmd += " -print0"
    cmd += " | xargs #{linuxFlag}-0 -n 1 #{path.normalize config.bin}"
    cmd += " > /dev/null" unless config.verbose
    console.log "command #{cmd}"
    cmd

  exports.setup = (runner) ->
    dir = path.normalize runner.data.dir
    config = runner.options defaults
    cmd = buildCommand dir
    grunt.log.writeln """
    Starting xmllint (target: #{runner.target.cyan}) in #{dir.cyan}
    """
    grunt.verbose.writeln "Execute: #{cmd}"
    done = runner.async()

  exports.run = ->
    cmdOptions = maxBuffer: config.maxBuffer
    exec cmd, cmdOptions, (err, stdout, stderr) ->
      grunt.log.write stdout if stdout
      grunt.fatal stderr if err and err.code isnt 0
      done()

  exports
