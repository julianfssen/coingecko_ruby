require 'test_helper'

class TestIndexes < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_indexes
    response = @client.indexes
    refute_empty(response)
  end

  def test_that_it_gets_indexes_ids
    response = @client.index_ids
    refute_empty(response)
  end

  def test_that_it_gets_indexes_by_market_id_and_coin_id
    response = @client.indexes_by_market_and_coin('cme_futures', 'btc')
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
