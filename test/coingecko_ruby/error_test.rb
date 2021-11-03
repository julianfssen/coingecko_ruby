require 'test_helper'
require 'byebug'

class TestError < Minitest::Test
  ClientErrorStatuses = (400...451).freeze
  ServerErrorStatuses = (500...511).freeze

  def setup
    @client = CoingeckoRuby::Client.new
  end

  def get_stubbed_endpoint(status)
    body = "{\"#{status}\":\"Internal Server Error\"}"
    stub_get('stubbed_endpoint').to_return(status: status, body: body, headers: { content_type: "application/json; charset=utf-8" })
    @client.get('stubbed_endpoint')
  end

  def test_that_it_rescues_http_exceptions_from_faraday_and_wraps_it_correctly
    ClientErrorStatuses.each do |status|
      assert_raises Faraday::Error do
        get_stubbed_endpoint(status)
      end
    end

    ServerErrorStatuses.each do |status|
      assert_raises Faraday::Error do
        get_stubbed_endpoint(status)
      end
    end
  end
end
