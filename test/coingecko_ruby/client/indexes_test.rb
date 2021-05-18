require 'test_helper'

class TestIndexes < Minitest::Test
  def setup
    @client = CoingeckoRuby.client
    VCR.insert_cassette name
  end

  def test_that_it_gets_indexes
    response = @client.get_indexes
    refute_empty(response)
  end

  def test_that_it_gets_indexes_ids
    response = @client.get_indexes_ids
    refute_empty(response)
  end

  def test_that_it_gets_indexes_by_market_id_and_index_id
    response = @client.get_indexes_by_market_and_index(market_id: 'cme_futures', index_id: 'btc')
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
