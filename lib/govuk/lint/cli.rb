require "govuk/lint"
require "govuk/lint/diff"
require "govuk/lint/config_file"

require "rubocop"

module Govuk
  module Lint
    class CLI < RuboCop::CLI
      def run(args = ARGV)
        args += ["--config",
                 ConfigFile.new.config_file_path]

        Diff.enable!(args) if args.include? "--diff"

        super(args)
      end
    end
  end
end
