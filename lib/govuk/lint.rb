require "govuk/lint/version"
require "govuk/lint/cli"
require "govuk/lint/diff"

module Govuk
  module Lint
    CONFIG_PATH = File.expand_path("../../../configs", __FILE__)
  end
end
