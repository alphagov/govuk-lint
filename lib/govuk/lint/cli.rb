require "govuk/lint"
require "govuk/lint/diff"

require "rubocop"

module Govuk
  module Lint
    class CLI < RuboCop::CLI
      def run(args = ARGV)
        args += ["--config",
                 File.join(Govuk::Lint::CONFIG_PATH, "rubocop/all.yml")]

        Diff.enable!(args) if args.include? "--diff"

        super(args)
      end
    end
  end
end
