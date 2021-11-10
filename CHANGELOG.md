# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:
Added `purs-tidy` formatter (#44 by @thomashoneyman)

## [v8.0.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v8.0.0) - 2021-02-26

Breaking changes:
- Added support for PureScript 0.14 and dropped support for all previous versions (#39, #40)

New features:
- Added roles declarations to forbid unsafe coercions (#32) 

Bugfixes:

Other improvements:
- Backfilled CHANGELOG.md file with previous releases (#33)
- Fixed link to documentation in the quickstart

## [v7.1.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v7.1.0) - 2020-09-13

- Exported `insertLines` function (#29)
- Switched default branch to `main`
- Updated to comply with Contributors library guidelines by adding new issue and pull request templates, updating documentation, and migrating to Spago for local development and CI (#30)

## [v7.0.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v7.0.0) - 2019-02-23

- Updated `purescript-web-*` dependencies

## [v6.0.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v6.0.0) - 2018-06-23

- Pass `onChange` delta for EditSession to the callback.

## [v5.0.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v5.0.0) - 2018-05-27

- Updated for PureScript 0.12

## [v4.0.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v4.0.0) - 2017-04-11

- Updated for PureScript v0.11 (@NasalMusician)

## [v3.0.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v3.0.0) - 2016-10-24

- Updated dependencies for PureScript 0.10.x

## [v2.0.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v2.0.0) - 2016-07-31

- Updated dependencies

## [v1.0.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v1.0.0) - 2016-06-23

- Updated for PureScript 0.9.1 and core libraries 1.0.

## [v0.11.1](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.11.1) - 2016-04-07

- Fixed various FFI errors

## [v0.11.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.11.0) - 2016-01-25

- Added `readonly`

## [v0.10.1](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.10.1) - 2016-01-20

- Fix mutation in autocomplete

## [v0.10.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.10.0) - 2015-12-10

- Added caption field to Completion

## [v0.9.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.9.0) - 2015-12-07

- Fixed Travis CI

## [v0.8.1](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.8.1) - 2015-11-08

- The `Ace.Types` module is now re-exported from `Ace`
- Options that allow autosizing behaviour are now exposed via `Ace.Editor`

## [v0.8.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.8.0) - 2015-08-16

- Updated to `purescript-dom` (#13)

## [v0.5.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.5.0) - 2015-07-16

- Updated for PureScript 0.7

## [v0.4.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.4.0) - 2015-05-27

- The `EAce` effect is now called `ACE`
- There is a new `Ace.Config` module for setting global configuration options such as `basePath`
- `TextMode` is now a `newtype` for `String` removing the necessity of declaring `TextMode` values with the FFI.

## [v0.2.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.2.0) - 2015-04-13

- Updated `purescript-foreign` dependency

## [v0.1.0](https://github.com/purescript-contrib/purescript-ace/releases/tag/v0.1.0) - 2015-03-29

- Initial release
