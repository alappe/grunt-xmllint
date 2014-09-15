###
grunt-xmllint

Copyright (c) 2014 Andreas Lappe
http://zimmer7.com
Licensed under the BSD license.
###

module.exports = (grunt) ->
  xmllint = (require './lib/xmllint').init grunt

  grunt.registerMultiTask 'xmllint', 'Run xmllint', ->
    xmllint.setup @
    xmllint.run()
