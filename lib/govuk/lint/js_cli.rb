require "govuk/lint"
require "jshint"
require "jshint/cli"
require "jshint/reporters"
require 'json'

module Jshint
  class Configuration
    # Support passing config object, not file path, allows us to customise it
    # at run time, eg, based on command line arguments
    def initialize(config = {})
      @options = config
    end

    # We don't want any paths to be included, apps should be explicit about the
    # paths they want to be linted
    def default_search_paths
      []
    end
  end
end

module Govuk
  module Lint
    class JsCLI
      def run(args = ARGV)
        linter = Jshint::Cli::run(:Default, nil, config(args))
        linter.errors.empty?
      end

    private

      def config(args)
        {
          'include_paths' => [args.first || '.'],
          'files' => '**/*[^.min].js',
          'options' => options
        }
      end

      def options
        JSON.load(File.read(options_file))
      end

      def options_file
        File.join(Govuk::Lint::CONFIG_PATH, "jshint/.jshintrc")
      end
    end
  end
end
