# Ace Documentation

This directory contains documentation for `ace`. If you are interested in contributing new documentation, please read the [contributor guidelines](../.github/CONTRIBUTING.md) and [What Nobody Tells You About Documentation](https://documentation.divio.com) for help getting started.

## API

The API is a low-level, type-safe, straightforward binding to Ace:

* All effectful JavaScript functions (i.e. virtually *all* functions!) are wrapped in the `Eff` monad for the appropriate effect type (`random`, `dom`, etc.).
* All JavaScript parameter or return values which may be nullable are wrapped / unwrapped using `Maybe`.
* PureScript record types are used for JavaScript objects.
* JavaScript's fake sum types are mapped to PureScript's real sum types, which necessitates encoding / decoding.

