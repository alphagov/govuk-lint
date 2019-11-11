require "govuk/lint"
require "govuk/lint/diff"
require "govuk/lint/config_file"

require "rubocop"

module Govuk
  module Lint
    class CLI < RuboCop::CLI
      def run(args = ARGV)
        warn "[DEPRECATION] `govuk-lint-ruby` is deprecated.  Please use `rubocop` with `rubocop-govuk` instead."
        config = ConfigFile.new

        args += [
          "--config",
          config.config_file_path,
        ]

        Diff.enable!(args) if args.include? "--diff"

        super(args)
      end
    end
  end
end
