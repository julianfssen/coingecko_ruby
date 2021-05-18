require 'test_helper'

class TestInfos < Minitest::Test
  def setup
    @client = CoingeckoRuby.client
    VCR.insert_cassette name
  end

  def test_that_it_gets_global_crypto_data
    response = @client.get_global_crypto_data
    refute_empty(response)
  end

  def test_that_it_gets_global_defi_data
    response = @client.get_global_defi_data
    refute_empty(response)
  end

  def test_that_it_gets_trending_searches
    response = @client.get_trending_searches
    refute_empty(response)
  end

  def test_that_it_gets_status_updates
    response = @client.get_status_updates
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
