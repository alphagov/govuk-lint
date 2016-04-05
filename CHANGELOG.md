# Unreleased

* Upgrade `rubocop` to `~> 0.39.0`

# 0.8.1

* Don't lint `db/schema.rb`.

# 0.8.0

* Disable `Style/ClosingParenthesisIndentation` which doesn't align with our styleguide.

# 0.7.0

* Disable cop `IfUnlessModifier` to allow single line if/unless blocks

# 0.6.2

* Add guard before accessing Rubocop instance var `@processed_source`
* Replace references to instance var `@processed_source` with attr_accessor

# 0.6.1

* Include Sass lint configs with gem (#32)

# 0.6.0

* Add sass linting using [scss-lint](https://github.com/brigade/scss-lint) (#30)
* When upgrading you may have a bundle dependency issue. Running `bundle update sass sass-rails` should fix it.

# 0.5.3

* Enforce spaces around literal hash and block braces (#27)

# 0.5.2

* Don't permit braces for options-style hash params
  `BracesAroundHashParameters` cop (#26)

# 0.5.1

* Update rubocop dependency to ~> 0.35.0
* Enable outdent for access modifiers
* Enable blank lines around access modifiers
* Show more infos for violations

# 0.5.0

* Enable all lint checks

# 0.4.1

* Permit trivial predicates (#19)

# 0.4.0

* Respect local `.rubocop.yml` files (#17)

# 0.3.0

* Allow single indentation in Multiline operations

# 0.2.0

* Disable string quoting check (#8)
* Disable line length check (#7)

# 0.1.2

* Fix a bug in executing the difftool with linebreaks

# 0.1.1

* Don't initialize rubocop during initialization of this gem. This prevents
  warnings about the current Ruby version on application boot.

# 0.1.0

* Original Gem release
