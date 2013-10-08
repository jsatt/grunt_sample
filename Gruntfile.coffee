module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        stylus:
            compile:
                files:
                    'tmp/podcast_client.css': 'stylesheets/**/*.styl'
        coffee:
            compile:
                files:
                    'tmp/podcast_client.js': 'scripts/**/*.coffee'
        concat:
            scripts:
                files:
                    'test_app/static/js/podcast_client.js': ['scripts/**/*.js', 'tmp/podcast_client.js']
            styles:
                files:
                    'test_app/static/css/podcast_client.css': ['stylesheets/**/*.css', 'tmp/podcast_client.css']
        watch:
            coffee:
                files: 'scripts/**/*.coffee'
                tasks: ['coffee', 'concat:scripts']
            js:
                files: 'scripts/**/*.js'
                tasks: ['concat:scripts']
            stylus:
                files: 'stylesheets/**/*.styl'
                tasks: ['stylus', 'concat:styles']
            css:
                files: 'stylesheets/**/*.css'
                tasks: ['concat:styles']

    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-stylus'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['stylus', 'coffee', 'concat']
    grunt.registerTask 'w', ['default', 'watch']
