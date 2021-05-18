require 'test_helper'

class TestExchanges < Minitest::Test
  def setup
    @client = CoingeckoRuby.client
    VCR.insert_cassette name
  end

  def test_that_it_gets_the_list_of_supported_exchanges
    response = @client.get_exchanges
    refute_empty(response)
  end

  def test_that_it_gets_complete_data_for_an_exchange
    response = @client.get_exchange_data(id: 'binance')
    refute_empty(response)
  end

  def test_that_it_gets_exchange_ids_supported_by_coingecko
    response = @client.get_exchanges_ids
    refute_empty(response)
  end

  def test_that_it_gets_exchange_tickers_from_an_exchange
    response = @client.get_exchange_tickers(id: 'binance')
    refute_empty(response)
  end

  def test_that_it_gets_a_specific_exchange_ticker_from_an_exchange
    response = @client.get_exchange_tickers(id: 'binance', options: { coin_ids: 'bitcoin' })
    refute_empty(response)
  end

  def test_that_it_gets_status_updates_for_an_exchange
    response = @client.get_exchange_status_updates(id: 'binance')
    refute_empty(response)
  end

  def test_that_it_gets_last_7_days_exchange_volume_from_an_exchange
    response = @client.get_exchange_volume(id: 'binance', days: 7)
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
