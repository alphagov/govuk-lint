require "gem_publisher"

task :publish_gem do |t|
  gem = GemPublisher.publish_if_updated("govuk-lint.gemspec", :rubygems)
  puts "Published #{gem}" if gem
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :test => :spec
task :default => :test
