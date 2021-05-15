require 'test_helper'

class TestCoins < Minitest::Test
  def setup
    @client = CoingeckoRuby.client
    VCR.insert_cassette name
  end

  def test_that_it_gets_the_list_of_supported_coins
    response = @client.coins_list
    refute_empty(response)
  end

  def test_that_it_gets_a_coins_complete_current_data
    response = @client.get_coin_data(id: 'bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_a_coins_tickers
    response = @client.get_tickers(id: 'bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_market_data_for_a_coin
    response = @client.get_markets(ids: 'bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_market_data_for_a_coin_in_myr
    response = @client.get_markets(ids: 'bitcoin', currency: 'myr')
    refute_empty(response)
  end

  def test_that_it_gets_market_data_for_multiple_coins_in_eth
    response = @client.get_markets(ids: 'bitcoin, ethereum', currency: 'eth')
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
