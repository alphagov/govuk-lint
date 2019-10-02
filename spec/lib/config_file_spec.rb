require "govuk/lint/config_file"

RSpec.describe Govuk::Lint::ConfigFile do
  describe "#config_file_path" do
    it "defaults to our all.yml" do
      path = Govuk::Lint::ConfigFile.new.config_file_path

      expect(path).to eql Govuk::Lint::ConfigFile::BASE_CONFIG_FILE
    end

    it "includes the local .rubocop.yml in the temporary config" do
      cli = Govuk::Lint::ConfigFile.new
      local_rubocop_file = Tempfile.new(".rubocop.yml")
      allow(cli).to receive(:local_config_file_path) { local_rubocop_file.path }

      file = YAML.load_file(cli.config_file_path)

      expect(file["inherit_from"]).to include(local_rubocop_file.path)
      expect(file["inherit_from"].size > 1).to eql(true)
    end

    it "copes when the garbage collector runs on the tempfile" do
      cli = Govuk::Lint::ConfigFile.new
      local_rubocop_file = Tempfile.new(".rubocop.yml")
      allow(cli).to receive(:local_config_file_path) { local_rubocop_file.path }

      path = cli.config_file_path
      GC.start # this is somewhat OS-dependent
      expect(File.file?(path)).to be_truthy
    end

    it "does not contain the `AllCops/Exclude` in temporary config"do
      cli = Govuk::Lint::ConfigFile.new
      file = YAML.load_file(cli.config_file_path)
      expect(file["AllCops"] || {}).to_not include("Exclude")
    end
  end
end
