require 'test_helper'

class TestExchanges < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_the_list_of_supported_exchanges
    response = @client.exchanges
    exchange_data = response[0]
    assert_includes exchange_data, 'name'
    assert_includes exchange_data, 'url'
    assert_includes exchange_data, 'image'
    assert_includes exchange_data, 'trade_volume_24h_btc'
  end

  def test_that_it_gets_complete_data_for_an_exchange
    response = @client.exchange('binance')
    assert_includes response, 'name'
    assert_includes response, 'url'
    assert_includes response, 'image'
    assert_includes response, 'trade_volume_24h_btc'
    assert_includes response, 'tickers'
  end

  def test_that_it_gets_exchange_ids_supported_by_coingecko
    response = @client.exchange_ids
    exchange_data = response[0]
    assert_includes exchange_data, 'id'
    assert_includes exchange_data, 'name'
  end

  def test_that_it_gets_exchange_tickers_from_an_exchange
    response = @client.exchange_tickers('binance')
    assert_includes response, 'name'
    assert_includes response, 'tickers'
  end

  def test_that_it_gets_a_specific_exchange_ticker_from_an_exchange
    response = @client.exchange_tickers('binance',  coin_ids: 'bitcoin')
    assert_includes response, 'name'
    assert_includes response, 'tickers'
  end

  def test_that_it_gets_status_updates_for_an_exchange
    response = @client.exchange_status('binance')
    assert_includes response, 'status_updates'
  end

  def test_that_it_gets_last_7_days_exchange_volume_from_an_exchange
    response = @client.exchange_volume('binance', days: 7)
    volume_data = response[0]
    refute_empty volume_data
  end

  def teardown
    VCR.eject_cassette
  end
end
