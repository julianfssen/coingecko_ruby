require 'test_helper'

class TestCoins < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_the_list_of_supported_coins
    response = @client.coins_list
    refute_empty(response)
  end

  def test_that_it_gets_a_coins_complete_current_data
    response = @client.coin('bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_a_coins_tickers
    response = @client.tickers('bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_market_data_for_a_coin
    response = @client.markets('bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_market_data_for_a_coin_in_myr
    response = @client.markets('bitcoin', vs_currency: 'myr')
    refute_empty(response)
  end

  def test_that_it_gets_market_data_for_multiple_coins_in_eth
    response = @client.markets('bitcoin, ethereum', vs_currency: 'eth')
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
