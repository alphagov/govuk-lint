require "govuk/lint"
require "eslintrb"

module Govuk
  module Lint
    class JsCLI
      def initialize(args, flags)
        @paths = args
        @excluded_paths = flags[:exclude]
      end

      def run
        Eslintrb::report(target_paths, options, nil, STDERR).empty?
      end

    private

      def target_paths
        expand_paths(@paths) - expand_paths(@excluded_paths)
      end

      def expand_paths(paths)
        paths.map { |path|
          if File.file?(path)
            [path]
          else
            Dir[File.join(path, glob_pattern)]
          end
        }.flatten.uniq
      end

      def glob_pattern
        '/**/*[^.min].js'
      end

      def options
        JSON.parse(File.read(options_filepath))
      end

      def options_filepath
        File.join(Govuk::Lint::CONFIG_PATH, "eslint/.eslintrc")
      end
    end
  end
end
