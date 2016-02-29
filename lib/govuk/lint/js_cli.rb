require "govuk/lint"
require "jshint"
require "jshint/cli"
require "jshint/reporters"

module Govuk
  module Lint
    class JsCLI
      def run(args = ARGV)
        config_path = File.join(Govuk::Lint::CONFIG_PATH, "jshint/jshint.yml")

        linter = Jshint::Cli::run(:Default, nil, config_path)
        linter.errors.empty?
      end
    end
  end
end
