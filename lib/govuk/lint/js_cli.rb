require "govuk/lint"
require "eslintrb"

module Govuk
  module Lint
    class JsCLI
      def run(args = ARGV)
        files = target_files(args.first)
        Eslintrb::report(files, options, nil, STDERR).empty?
      end

    private

      def target_files(pattern)
        if File.file?(pattern)
          [pattern]
        else
          Dir[pattern + '/**/*[^.min].js']
        end
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
