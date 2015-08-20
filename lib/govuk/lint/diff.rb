module Govuk
  module Lint
    module Diff
      module EnabledLines
        def enabled_line?(line_number)
          super(line_number) &&
            Diff.changed_lines[@processed_source.path].include?(line_number)
        end
      end

      module TargetFinder
        def find(args)
          super(args).select { |f| Diff.changed_lines.keys.include? f }
        end
      end

      def self.enable!(args)
        args.delete("--diff")
        RuboCop::Cop::Cop.prepend EnabledLines
        RuboCop::TargetFinder.prepend TargetFinder
      end

      def self.changed_lines
        @changed_lines ||= begin
          changes = changed_files.map do |file|
            next unless File.exist?(file)
            [file, `git difftool #{commit_options} \
                    -y \
                    -x 'diff \
                      --new-line-format="%dn " \
                      --unchanged-line-format="" \
                      --changed-group-format="%>"' \
                    #{file}`.split.map(&:to_i)]
          end

          Hash[changes.compact].tap { |h| h.default = [] }
        end
      end

    private
      def self.changed_files
        `git diff #{commit_options} --name-only`.
          split.
          select { |f| f =~ %r{.rb$} }.
          map { |f| File.expand_path(f.chomp, "./") }
      end

      def self.commit_options
        "--cached origin/master"
      end
    end
  end
end
