{ name = "ace"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "either"
  , "foldable-traversable"
  , "foreign"
  , "functions"
  , "maybe"
  , "nullable"
  , "partial"
  , "prelude"
  , "psci-support"
  , "refs"
  , "st"
  , "transformers"
  , "web-html"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs", "example/**/*.purs" ]
}
