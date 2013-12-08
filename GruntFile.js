module.exports = function (grunt) {
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-open');
    grunt.loadNpmTasks('grunt-nodemon');
    grunt.loadNpmTasks('grunt-concurrent');
    grunt.loadNpmTasks('grunt-iced-coffee');
 
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        coffee: {
            compile: {
                expand: true,
                cwd: '.',
                src: ['**/*.coffee', '!**/node_modules/**'],
                dest: 'bin/',
                ext: '.js'
            }
        },
        watch: {
            all: {
                files: ['**/*.coffee', '*.coffee','!**/node_modules/**'],
                livereload: true,
                tasks: ['coffee:compile'],
                options: {
                  livereload: true,
                }
            }
        },
        open: {
            dev: {
                path: 'http://localhost:3000/'
            }
        },
        nodemon: {
            server: {
                options: {
                    file: 'bin/server.js',
                    nodeArgs: ['--debug'],
                    watchedExtensions: ['js'],
                    watchedFolders: ['bin'],
                    delayTime: 1
                }
            }
        },
        concurrent: {
            all: {
                tasks: ['nodemon:server', 'watch:all'],
                options: {
                    logConcurrentOutput: true
                }
            }
        }
    });

    grunt.registerTask('default', ['open', 'concurrent:all']);
}