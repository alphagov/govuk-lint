# DEPRECATED

This repository and Gem has been deprecated and is no longer supported.

To lint Ruby and RSpec projects please consider using [rubocop][rubocop] with [rubocop-govuk][rubocop-govuk].

To lint SASS projects please consider using [scss-lint][scss-lint] with [scss-lint-govuk][scss-lint-govuk].

For guidance on upgrading to these tools see the [migrate from govuk-lint][migrate-guide] page in the developer docs.

# GOV.UK Lint

This repo configures various linters to comply with our [style guides][guides].

## Supported languages

### Puppet

We maintain a set of tasks for linting and sanity checks in the
[gds-operations/puppet-syntax](https://github.com/gds-operations/puppet-syntax)
repository.

### Ruby

Linter: [rubocop][rubocop]

To use, include `govuk-lint` in your Gemfile and run:
```
bundle exec govuk-lint-ruby <files and directories>
```

It's best to lint just your app directories and not those belonging to the
framework, e.g.

```
bundle exec govuk-lint-ruby app lib spec
```

Useful options:

- `-a`: Auto-correct violations if possible
- `-R`: Also run Rails-specific cops
- `--diff`: Only lint lines that have been changed in the current diff
- `--cached`: Used with `--diff` to lint only lines changed between
`origin/master` and `HEAD`.

See more options in the [rubocop][rubocop] README.

#### RSpec

You can enable RSpec cops by adding the following line to the `.rubocop.yml` file in your project:

```
require: rubocop-rspec
```

### Sass

Linter: [scss-lint](https://github.com/brigade/scss-lint)

To use, include `govuk-lint` in your Gemfile and run:
```
bundle exec govuk-lint-sass <directory or file>
bundle exec govuk-lint-sass app/assets/stylesheets
```

When linting your app any assets within `vendor` will be ignored by
default.

Auto-correction and `--diff` mode are unavailable.

[guides]: https://github.com/alphagov/styleguides
[migrate-guide]: https://docs.publishing.service.gov.uk/manual/migrate-from-govuk-lint.html
[rubocop]: https://github.com/bbatsov/rubocop
[rubocop-govuk]: https://github.com/alphagov/rubocop-govuk
[scss-lint]: https://github.com/sds/scss-lint
[scss-lint-govuk]: https://github.com/alphagov/scss-lint-govuk
