$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require 'coingecko_ruby'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
end
