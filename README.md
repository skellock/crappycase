# crappycase 💩

[![CircleCI](https://circleci.com/gh/skellock/crappycase.svg?style=svg)](https://circleci.com/gh/skellock/crappycase)

A crappy [`nim`](https://nim-lang.org) package for various case conversions with strings.

# Installing

`nimble install https://github.com/skellock/crappycase`

# Usage

```nim
import crappycase

kebab("foo bar")          # foo-bar
snake("foo bar")          # foo_bar
screamingSnake("foo bar") # FOO_BAR
pascal("foo bar")         # FooBar
camel("foo bar")          # fooBar
splitCase("foo bar)       # @["foo", "bar"]
```

### For Idents Only

These conversions are mainly for idents. For example `kebab("hey* ya")` will be `hey-ya`. So this package is really only good for identifiers and such.

I'd be up for a PR to be less destructive if you need.

# License

MIT. I guess.

# Contributing

Fork it. Pull it. Patch it. Push it.

Send a PR, that should do it.
