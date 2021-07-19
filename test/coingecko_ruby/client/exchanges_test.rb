require 'test_helper'

class TestExchanges < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_the_list_of_supported_exchanges
    response = @client.exchanges
    refute_empty(response)
  end

  def test_that_it_gets_complete_data_for_an_exchange
    response = @client.exchange('binance')
    refute_empty(response)
  end

  def test_that_it_gets_exchange_ids_supported_by_coingecko
    response = @client.exchange_ids
    refute_empty(response)
  end

  def test_that_it_gets_exchange_tickers_from_an_exchange
    response = @client.exchange_tickers('binance')
    refute_empty(response)
  end

  def test_that_it_gets_a_specific_exchange_ticker_from_an_exchange
    response = @client.exchange_tickers('binance',  coin_ids: 'bitcoin')
    refute_empty(response)
  end

  def test_that_it_gets_status_updates_for_an_exchange
    response = @client.exchange_status('binance')
    refute_empty(response)
  end

  def test_that_it_gets_last_7_days_exchange_volume_from_an_exchange
    response = @client.exchange_volume('binance', days: 7)
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
