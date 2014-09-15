#
# grunt-xmllint
#
#
'use strict'

module.exports = (grunt) ->
  grunt.initConfig
    xmllint:
      test:
        dir: 'test'

  grunt.loadTasks 'tasks'

  grunt.registerTask 'default', ['xmllint']

