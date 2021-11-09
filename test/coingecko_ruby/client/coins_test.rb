require 'test_helper'

class TestCoins < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_the_list_of_supported_coins
    response = @client.coins_list
    data = response[0]
    assert_includes data, 'id'
    assert_includes data, 'symbol'
    assert_includes data, 'name'
  end

  def test_that_it_gets_a_coins_complete_current_data
    response = @client.coin('bitcoin')
    # assert_includes response, 'id'
    # assert_includes response, 'symbol'
    # assert_includes response, 'name'
    # assert_includes response, 'market_data'
    # assert_includes response, 'tickers'
  end

  def test_that_it_gets_a_coins_tickers
    response = @client.tickers('bitcoin')
    assert_includes response, 'name'
    assert_includes response, 'tickers'
  end

  def test_that_it_gets_market_data_for_a_coin
    response = @client.markets('bitcoin')
    data = response[0]
    assert_includes data, 'id'
    assert_includes data, 'symbol'
    assert_includes data, 'name'
    assert_includes data, 'current_price'
    assert_includes data, 'market_cap'
    assert_includes data, 'total_volume'
  end

  def test_that_it_gets_market_data_for_a_coin_in_myr
    response = @client.markets('bitcoin', vs_currency: 'myr')
    data = response[0]
    assert_includes data, 'id'
    assert_includes data, 'symbol'
    assert_includes data, 'name'
    assert_includes data, 'current_price'
    assert_includes data, 'market_cap'
    assert_includes data, 'total_volume'
  end

  def test_that_it_gets_market_data_for_multiple_coins_in_eth
    response = @client.markets('bitcoin, ethereum', vs_currency: 'eth')
    data = response[0]
    assert_includes data, 'id'
    assert_includes data, 'symbol'
    assert_includes data, 'name'
    assert_includes data, 'current_price'
    assert_includes data, 'market_cap'
    assert_includes data, 'total_volume'
  end

  def test_that_it_gets_market_data_for_a_coin_from_a_contract_address
    response = @client.contract('ethereum', '0xdAC17F958D2ee523a2206206994597C13D831ec7')
    assert_includes response, 'id'
    assert_includes response, 'symbol'
    assert_includes response, 'name'
    assert_includes response, 'block_time_in_minutes'
    assert_includes response, 'hashing_algorithm'
    assert_includes response, 'market_data'
    assert_includes response, 'tickers'
  end

  def teardown
    VCR.eject_cassette
  end
end
