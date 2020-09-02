# Ace

[![CI](https://github.com/purescript-contrib/purescript-ace/workflows/CI/badge.svg?branch=main)](https://github.com/purescript-contrib/purescript-ace/actions?query=workflow%3ACI+branch%3Amain)
[![Release](http://img.shields.io/github/release/purescript-contrib/purescript-ace.svg)](https://github.com/purescript-contrib/purescript-ace/releases)
[![Pursuit](http://pursuit.purescript.org/packages/purescript-ace/badge)](http://pursuit.purescript.org/packages/purescript-ace)
[![Maintainer: garyb](https://img.shields.io/badge/maintainer-garyb-teal.svg)](http://github.com/garyb)

PureScript bindings for the [Ace code editor](http://ace.c9.io).

## Installation

Install `ace` with [Spago](https://github.com/purescript/spago):

```sh
spago install ace
```

You may either include a CDN link in your project's `index.html`, or install the `ace-builds` npm dependency and let a bundler package it in your app. See Ace's [embedding guide](https://ace.c9.io/#nav=embedding) for more information.

### Here's a CDN example:
```html
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Ace Demo</title>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.min.js" charset="utf-8"></script>
</head>

<body>
  <script src="./index.js"></script>
</body>

</html>
```

### To install via NPM instead:
```
npm install ace-builds
```

Note that you'll probably need the `src-noconflict` path when bundling with Common JS modules (PureScript's current output, until we switch to ES Modules in ~`0.15.0`). For example:
```html
<script src="../node_modules/ace-builds/src-noconflict/ace.js"></script>
```

## Quick start

The quick start hasn't been written yet (contributions are welcome!). The quick start covers a common, minimal use case for the library, whereas longer examples and tutorials are kept in the [docs directory](./docs.)

## Documentation

`ace` documentation is stored in a few places:

1. Module documentation is [published on Pursuit](https://pursuit.purescript.org/packages/purescript-ace).
2. Written documentation and [the changelog](./docs/CHANGELOG.md) are kept in [the docs directory](./docs).
3. The [examples directory](./examples) demonstrates how to embed the Ace editor and configure it via the PureScript API.

If you get stuck, there are several ways to get help:

- [Open an issue](https://github.com/purescript-contrib/purescript-ace/issues) if you have encountered a bug or problem.
- [Search or start a thread on the PureScript Discourse](https://discourse.purescript.org) if you have general questions. You can also ask questions in the `#purescript` and `#purescript-beginners` channels on the [Functional Programming Slack](https://functionalprogramming.slack.com) ([invite link](https://fpchat-invite.herokuapp.com/)).

## Contributing

You can contribute to `ace` in several ways:

1. If you encounter a problem or have a question, please [open an issue](https://github.com/purescript-contrib/purescript-ace/issues). We'll do our best to work with you to resolve or answer it.

2. If you would like to contribute code, tests, or documentation, please [read the contributor guide](./.github/CONTRIBUTING.md). It's a short, helpful introduction to contributing to this library, including development instructions.

3. If you have written a library, tutorial, guide, or other resource based on this package, please share it on the [PureScript Discourse](https://discourse.purescript.org)! Writing libraries and learning resources are a great way to help this library succeed.
