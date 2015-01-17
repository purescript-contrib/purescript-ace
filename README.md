# purescript-ace

Purescript bindings for the [Ace code editor](http://ace.c9.io).

**Note**: *SlamData is offering a $2K bounty to whoever authors the first Pull Request that we merge into this repository. This is a great way to learn some Purescript, as well as contribute to a 100% open source library released under a commercial-friendly MIT license.*

## API

The API is a low-level, type-safe, straightforward binding to Ace:

* All effectful Javascript functions (i.e. virtually *all* functions!) are wrapped in the `Eff` monad for the appropriate effect type (`random`, `dom`, etc.).
* All Javascript parameter or return values which may be nullable are wrapped / unwrapped using `Maybe`.
* Purescript record types are used for Javascript objects.
* Javascript's fake sum types are mapped to Purescript's real sum types, which necessitates encoding / decoding.

## Examples

The `examples` directory contains an `index.html`, which contains a variety of examples of how to embed the Ace editor and configure it using the Purescript API.