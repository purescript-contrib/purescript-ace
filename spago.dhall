{ name = "ace"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "foreign"
  , "nullable"
  , "prelude"
  , "psci-support"
  , "refs"
  , "web-html"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
