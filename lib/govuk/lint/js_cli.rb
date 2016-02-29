require "govuk/lint"
require "jshint"
require "jshint/cli"
require "jshint/reporters"

module Jshint
  class Configuration
    def initialize(config = {})
      @options = config
    end
  end
end

module Govuk
  module Lint
    class JsCLI
      def run(args = ARGV)
        config = YAML.load_file(File.join(Govuk::Lint::CONFIG_PATH, "jshint/jshint.yml"))
        config['include_paths'] = [args.first || '.']

        linter = Jshint::Cli::run(:Default, nil, config)
        linter.errors.empty?
      end
    end
  end
end
