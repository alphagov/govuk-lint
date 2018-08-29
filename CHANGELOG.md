# 3.9.0

* Bump Rubocop to version ~> 0.58
* Bump Rubocop RSpec to version ~> 1.28

# 3.8.0

* Bump Rubocop to version 0.52.1 to fix Ruby 2.5.0 issue
* Bump Ruby to 5.2.0

# 3.7.0

* Excluded `namespace` blocks in rake tasks from Metrics/BlockLength

# 3.6.0

* Disabled Bundler/DuplicatedGem (#93)

# 3.5.0

* Disabled Rails/SkipsModelValidations (#92)

# 3.4.0

* Metrics/BlockLength for specs in sub-dirs (#87)
* Bump rubocop-rspec to v1.19.0 to fix deprecation warnings (#89)
* Fix config for Lint/LiteralInCondition cop which was renamed in Rubocop v0.50.0 (#89)

# 3.3.1

* Bump Rubocop to version 0.51.0 to fix a security vulnerability.

# 3.3.0

* Don't complain about block length in tests (#82)
* Make RSpec-related cops available from rubocop-rspec (#83)

# 3.2.0

* Relax class naming rules for Sass to allow hyphenated BEM classes (#79)

# 3.1.0

* Fix namespace for `ClosingParenthesisIndentation` config

# 3.0.0

* Upgrade `rubocop` to `~> 0.49.0`

# 2.1.0

* Enable `Lint/PercentStringArray`, protect against commas and quotes in word arrays (#71)
* Disable `Style/SafeNavigation` (#68)

# 2.0.0

* Upgrade `rubocop` to `~> 0.43.0`

# 1.2.1

* Allow local .rubocop.yml to override the `AllCops/Exclude` configuration

# 1.2.0

* Unpin `rake` version
* Unpin `scss_lint` version

# 1.1.0

* Disable `Performance/TimesMap`, and `Style/FrozenStringLiteralComment`
* Enable `Style/MutableConstant`

# 1.0.0

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
