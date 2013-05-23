require File.expand_path('../../lib/png-encode', __FILE__)

FIXTURE_ROOT = File.expand_path('../fixtures', __FILE__)
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
end