require 'test_helper'

class TestEvents < Minitest::Test
  def setup
    @client = CoingeckoRuby.client
    VCR.insert_cassette name
  end

  def test_that_it_gets_event_countries
    response = @client.get_event_countries
    refute_empty(response)
  end

  def test_that_it_gets_event_types
    response = @client.get_event_types
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
