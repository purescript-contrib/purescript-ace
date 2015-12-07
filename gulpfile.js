'use strict'

var gulp        = require('gulp')
  , purescript  = require('gulp-purescript')
  , jshint      = require('gulp-jshint')
  ;

var sources = [
    'src/**/*.purs',
    'bower_components/purescript-*/src/**/*.purs'
];
var foreigns = [
    'src/**/*.js',
    'bower_components/purescript-*/src/**/*.js'
];
var exampleSources = [
    'example/src/**/*.purs'
];
var exampleForeigns = [
    'example/src/**/*.js'
];

gulp.task('lint', function() {
  return gulp.src('src/**/*.js')
    .pipe(jshint())
    .pipe(jshint.reporter());
});

gulp.task('make', ['lint'], function() {
    return purescript.psc({
        src: sources,
        ffi: foreigns
    });
});

gulp.task('example', ['lint'], function() {
    return purescript.psc({
        src: sources.concat(exampleSources),
        ffi: foreigns.concat(exampleForeigns)
    });
});

gulp.task('bundle', ['example'], function() {
    return purescript.pscBundle({
        src: 'output/**/*.js',
        output: 'example/psc.js',
        main: "Main"
    });
});

gulp.task('watch-browser', ["bundle"], function() {
    gulp.watch(sources
               .concat(exampleSources)
               .concat(foreigns)
               .concat(exampleForeigns),
               ["bundle"]);

});

gulp.task('watch-make', ["make"], function() {
    gulp.watch(sources.concat(foreigns), ["make"]);
});

gulp.task('default', ["bundle"]);
