import crappycase, strutils

doAssert splitCase("").join("|") == ""
doAssert splitCase("foobar").join("|") == "foobar"
doAssert splitCase("FOOBAR").join("|") == "FOOBAR"
doAssert splitCase("Foobar").join("|") == "Foobar"
doAssert splitCase("fooBar").join("|") == "foo|Bar"
doAssert splitCase("foobaR").join("|") == "fooba|R"
doAssert splitCase("fooBAR").join("|") == "foo|BAR"
doAssert splitCase("foo-bar").join("|") == "foo|bar"
doAssert splitCase("foo bar").join("|") == "foo|bar"
doAssert splitCase("Foo Bar").join("|") == "Foo|Bar"
doAssert splitCase("Foo_Bar").join("|") == "Foo|Bar"
doAssert splitCase("Foo_Bar").join("|") == "Foo|Bar"
doAssert splitCase("Foo/Bar").join("|") == "Foo|Bar"
doAssert splitCase("Foo / Bar").join("|") == "Foo|Bar"
doAssert splitCase("Foo.bar").join("|") == "Foo|bar"
doAssert splitCase("FOO_BAR").join("|") == "FOO|BAR"
doAssert splitCase(" foo bar").join("|") == "foo|bar"
doAssert splitCase("foo    bar").join("|") == "foo|bar"

doAssert kebab("foo BAR9") == "foo-bar9"

doAssert snake("foo BAR9") == "foo_bar9"

doAssert screamingSnake("foo BAR9") == "FOO_BAR9"

doAssert pascal("foo bar") == "FooBar"
doAssert pascal("foo BAR9") == "FooBar9"
doAssert pascal("foo") == "Foo"

doAssert camel("foo bar") == "fooBar"
doAssert camel("foo BAR9") == "fooBar9"
doAssert camel("foo") == "foo"
