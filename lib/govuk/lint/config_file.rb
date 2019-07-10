require 'tempfile'
require 'yaml'

module Govuk
  module Lint
    class ConfigFile
      CONFIG_PATH = File.expand_path("../../../../configs", __FILE__)
      BASE_CONFIG_FILE = File.join(CONFIG_PATH, "rubocop/all.yml")

      def config_file_path
        return BASE_CONFIG_FILE unless File.exist?(local_config_file_path)
        tempfile_for_configs.path
      end

    private

      def merged_global_and_local_configs
        config = load_local_config
        config['inherit_from'] ||= []
        config['inherit_from'].unshift(BASE_CONFIG_FILE)
        config
      end

      def load_local_config
        YAML.load_file(local_config_file_path)
      end

      def local_config_file_path
        @local_config_file_path ||= File.join(Dir.pwd, ".rubocop.yml")
      end

      def tempfile_for_configs
        @tempfile_for_configs ||= begin
                                   file = Tempfile.new('tmp-rubocop-all.yml')
                                   file.write(merged_global_and_local_configs.to_yaml)
                                   file.close
                                   file
                                 end
      end
    end
  end
end
