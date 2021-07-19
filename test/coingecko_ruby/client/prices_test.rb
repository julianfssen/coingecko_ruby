require 'test_helper'

class TestPrices < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_price_for_one_coin
    response = @client.price('bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_price_for_one_coin_in_a_different_currency
    response = @client.price('bitcoin', currency: 'myr')
    refute_empty(response)
  end

  def test_that_it_gets_historical_price_for_one_coin_at_a_previous_date
    response = @client.historical_price('bitcoin', date: '30-12-2017')
    refute_empty(response)
  end

  def test_that_it_gets_minutely_historical_prices_for_one_coin
    response = @client.minutely_historical_price('bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_hourly_historical_prices_for_one_coin
    response = @client.hourly_historical_price('bitcoin', days: 30)
    refute_empty(response)
  end

  def test_that_it_gets_daily_historical_prices_for_one_coin
    response = @client.daily_historical_price('bitcoin', days: 90)
    refute_empty(response)
  end

  def test_that_it_gets_ohlc_data_for_one_coin_in_the_last_7_days
    response = @client.ohlc('bitcoin', days: 7)
    refute_empty(response)
  end

  def test_that_it_gets_ohlc_data_for_one_coin_in_the_last_30_days_in_myr
    response = @client.ohlc('bitcoin', currency: 'myr', days: 30)
    refute_empty(response)
  end

  def test_that_it_gets_btc_to_usd_exchange_rate
    response = @client.exchange_rate(from: 'bitcoin', to: 'usd')
    refute_empty(response)
  end

  def test_that_it_gets_btc_to_eth_exchange_rate
    response = @client.exchange_rate(from: 'bitcoin', to: 'ethereum')
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
