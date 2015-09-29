require "govuk/lint/config_file"

RSpec.describe Govuk::Lint::ConfigFile do
  describe '#config_file_path' do
    it 'defaults to our all.yml' do
      path = Govuk::Lint::ConfigFile.new.config_file_path

      expect(path).to eql Govuk::Lint::ConfigFile::BASE_CONFIG_FILE
    end

    it 'includes the local .rubocop.yml in the temporary' do
      cli = Govuk::Lint::ConfigFile.new
      local_rubocop_file = Tempfile.new('.rubocop.yml').path
      allow(cli).to receive(:local_config_file_path).and_return(local_rubocop_file)

      file = YAML.load_file(cli.config_file_path)

      expect(file['inherit_from']).to include(local_rubocop_file)
      expect(file['inherit_from'].size > 1).to eql(true)
    end
  end
end
