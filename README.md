# purescript-ace

Purescript bindings for the [Ace code editor](http://ace.c9.io).

## API

The API is a low-level, type-safe, straightforward binding to Ace:

* All effectful Javascript functions (i.e. virtually *all* functions!) are wrapped in the `Eff` monad for the appropriate effect type (`random`, `dom`, etc.).
* All Javascript parameter or return values which may be nullable are wrapped / unwrapped using `Maybe`.
* Purescript record types are used for Javascript objects.
* Javascript's fake sum types are mapped to Purescript's real sum types, which necessitates encoding / decoding.

## Examples

The `examples` directory contains an `index.html`, which contains a variety of examples of how to embed the Ace editor and configure it using the Purescript API.

## Tests

This project has no real tests. However, most bound functions are exercised in the examples, to ensure the bindings and necessary wrapping, unwrapping, encoding, and decoding has been performed correctly.
