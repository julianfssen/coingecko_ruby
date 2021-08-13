require 'test_helper'

class TestEvents < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_event_countries
    response = @client.event_countries
    assert_includes response, 'data'
    assert_includes response, 'count'
  end

  def test_that_it_gets_event_types
    response = @client.event_types
    assert_includes response, 'data'
    assert_includes response, 'count'
  end

  def teardown
    VCR.eject_cassette
  end
end
