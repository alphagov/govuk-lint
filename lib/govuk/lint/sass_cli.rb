require "govuk/lint"
require "scss_lint"
require "scss_lint/cli"

module Govuk
  module Lint
    class SassCLI < SCSSLint::CLI
      def run(args = ARGV)
        args += [
                  "--config",
                  File.join(Govuk::Lint::CONFIG_PATH, "scss_lint/gds-sass-styleguide.yml"),
                  "--no-color",
                  "--exclude",
                  File.join(args.first, "**/vendor/*"),
                ]

        super(args)
      end
    end
  end
end
