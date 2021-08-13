require 'test_helper'

class TestIndexes < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_indexes
    response = @client.indexes
    index_data = response[0]
    assert_includes index_data, 'name'
    assert_includes index_data, 'id'
    assert_includes index_data, 'market'
    assert_includes index_data, 'last'
  end

  def test_that_it_gets_indexes_ids
    response = @client.index_ids
    index_data = response[0]
    assert_includes index_data, 'name'
    assert_includes index_data, 'id'
  end

  def test_that_it_gets_indexes_by_market_id_and_coin_id
    response = @client.indexes_by_market_and_coin('cme_futures', 'btc')
    assert_includes response, 'name'
    assert_includes response, 'market'
    assert_includes response, 'last'
  end

  def teardown
    VCR.eject_cassette
  end
end
