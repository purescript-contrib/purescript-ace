# Ace Documentation

This directory contains documentation for `ace`. If you are interested in contributing new documentation, please read the [contributor guidelines](../.github/CONTRIBUTING.md) and [What Nobody Tells You About Documentation](https://documentation.divio.com) for help getting started.

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
