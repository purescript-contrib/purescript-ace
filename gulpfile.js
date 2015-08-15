'use strict'

var gulp        = require('gulp')
  , purescript  = require('gulp-purescript')
  , runSequence = require('run-sequence')
  , jshint      = require('gulp-jshint')
  ;

function sequence () {
    var args = [].slice.apply(arguments);
    return function() {
        runSequence.apply(null, args);
    };
}

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

gulp.task('docs', function() {
    return purescript.pscDocs({
        src: sources,
        docgen: {
            "Ace": "docs/Ace.md",
            "Ace.Anchor": "docs/Ace/Anchor.md",
            "Ace.BackgroundTokenizer": "docs/Ace/BackgroundTokenizer.md",
            "Ace.Config": "docs/Ace/Config.md",
            "Ace.Document": "docs/Ace/Document.md",
            "Ace.Editor": "docs/Ace/Editor.md",
            "Ace.EditSession": "docs/Ace/EditSession.md",
            "Ace.Range": "docs/Ace/Range.md",
            "Ace.ScrollBar": "docs/Ace/ScrollBar.md",
            "Ace.Search": "docs/Ace/Search.md",
            "Ace.Selection": "docs/Ace/Selection.md",
            "Ace.TokenIterator": "docs/Ace/TokenIterator.md",
            "Ace.Tokenizer": "docs/Ace/Tokenizer.md",
            "Ace.Types": "docs/Ace/Types.md",
            "Ace.UndoManager": "docs/Ace/UndoManager.md",
            "Ace.VirtualRenderer": "docs/Ace/VirtualRenderer.md"
        }
    });
});

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

gulp.task('watch-browser', function() {
    gulp.watch(sources.concat(exampleSources).concat(foreigns).concat(exampleForeigns), sequence('bundle', 'docs'))
});

gulp.task('watch-make', function() {
    gulp.watch(sources.concat(foreigns), sequence('make', 'docs'));
});

gulp.task('default', sequence('make', 'docs', 'example'));
