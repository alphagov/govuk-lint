require 'tempfile'
require 'yaml'

module Govuk
  module Lint
    class ConfigFile
      CONFIG_PATH = File.expand_path("../../../../configs", __FILE__)
      BASE_CONFIG_FILE = File.join(CONFIG_PATH, "rubocop/all.yml")

      def config_file_path
        return BASE_CONFIG_FILE unless File.exist?(local_config_file_path)

        config = merged_global_and_local_configs
        file = create_tempfile_for_configs(config)
        file.path
      end

    private

      def merged_global_and_local_configs
        config = load_global_config
        config['inherit_from'] = absolutize_paths(config)
        config['inherit_from'] << local_config_file_path
        config
      end

      def load_global_config
        YAML.load_file(BASE_CONFIG_FILE)
      end

      def absolutize_paths(config)
        config['inherit_from'].map do |filename|
          File.join(CONFIG_PATH, "rubocop/#{filename}")
        end
      end

      def local_config_file_path
        @local_config_file_path ||= File.join(Dir.pwd, ".rubocop.yml")
      end

      def create_tempfile_for_configs(config)
        file = Tempfile.new('tmp-rubocop-all.yml')
        file.write(config.to_yaml)
        file.close
        file
      end
    end
  end
end
