require 'test_helper'

class TestPrices < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_price_for_one_coin
    response = @client.price('bitcoin')
    assert_includes response, 'bitcoin'
  end

  def test_that_it_gets_price_for_one_coin_in_a_different_currency
    response = @client.price('bitcoin', currency: 'myr')
    assert_includes response, 'bitcoin'
    conversion_data = response.values[0]
    assert_includes conversion_data, 'myr'
  end

  def test_that_it_gets_historical_price_for_one_coin_at_a_previous_date
    response = @client.historical_price('bitcoin', date: '30-12-2017')
    assert_includes response, 'id'
    assert_includes response, 'symbol'
    assert_includes response, 'name'
    assert_includes response, 'image'
    assert_includes response, 'market_data'
  end

  def test_that_it_gets_minutely_historical_prices_for_one_coin
    response = @client.minutely_historical_price('bitcoin')
    assert_includes response, 'prices'
    assert_includes response, 'market_caps'
    assert_includes response, 'total_volumes'
  end

  def test_that_it_gets_hourly_historical_prices_for_one_coin
    response = @client.hourly_historical_price('bitcoin', days: 30)
    assert_includes response, 'prices'
    assert_includes response, 'market_caps'
    assert_includes response, 'total_volumes'
  end

  def test_that_it_gets_daily_historical_prices_for_one_coin
    response = @client.daily_historical_price('bitcoin', days: 90)
    assert_includes response, 'prices'
    assert_includes response, 'market_caps'
    assert_includes response, 'total_volumes'
  end

  def test_that_it_gets_ohlc_data_for_one_coin_in_the_last_7_days
    response = @client.ohlc('bitcoin', days: 7)
    data = response[0]
    refute_empty data
  end

  def test_that_it_gets_ohlc_data_for_one_coin_in_the_last_30_days_in_myr
    response = @client.ohlc('bitcoin', currency: 'myr', days: 30)
    data = response[0]
    refute_empty data
  end

  def test_that_it_gets_btc_to_usd_exchange_rate
    response = @client.exchange_rate(from: 'bitcoin', to: 'usd')
    assert_includes response, 'bitcoin'
    conversion_data = response.values[0]
    assert_includes conversion_data, 'usd'
  end

  def test_that_it_gets_btc_to_eth_exchange_rate
    response = @client.exchange_rate(from: 'bitcoin', to: 'eth')
    assert_includes response, 'bitcoin'
    conversion_data = response.values[0]
    assert_includes conversion_data, 'eth'
  end

  def teardown
    VCR.eject_cassette
  end
end
