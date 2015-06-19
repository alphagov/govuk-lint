# GOV.UK Lint

This repo configures various linters to comply with our [style guides][guides].

## Supported languages

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

[guides]: https://github.com/alphagov/styleguides
[rubocop]: https://github.com/bbatsov/rubocop
