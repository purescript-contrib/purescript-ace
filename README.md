# purescript-ace

PureScript bindings for the [Ace code editor](http://ace.c9.io).

[![Latest release](http://img.shields.io/bower/v/purescript-ace.svg)](https://github.com/slamdata/purescript-ace/releases)
[![Build Status](https://travis-ci.org/slamdata/purescript-ace.svg?branch=master)](https://travis-ci.org/slamdata/purescript-ace)
[![Dependency Status](https://www.versioneye.com/user/projects/5769eab0fdabcd003d086c62/badge.svg?style=flat)](https://www.versioneye.com/user/projects/5769eab0fdabcd003d086c62)

## API

The API is a low-level, type-safe, straightforward binding to Ace:

* All effectful JavaScript functions (i.e. virtually *all* functions!) are wrapped in the `Eff` monad for the appropriate effect type (`random`, `dom`, etc.).
* All JavaScript parameter or return values which may be nullable are wrapped / unwrapped using `Maybe`.
* PureScript record types are used for JavaScript objects.
* JavaScript's fake sum types are mapped to PureScript's real sum types, which necessitates encoding / decoding.

## Examples

The `examples` directory contains an `index.html`, which contains a variety of examples of how to embed the Ace editor and configure it using the PureScript API.

## Tests

This project has no real tests. However, most bound functions are exercised in the examples, to ensure the bindings and necessary wrapping, unwrapping, encoding, and decoding has been performed correctly.

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-ace).
