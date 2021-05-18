require 'test_helper'

class TestCategories < Minitest::Test
  def setup
    @client = CoingeckoRuby.client
    VCR.insert_cassette name
  end

  def test_that_it_gets_the_list_of_categories
    response = @client.get_categories
    refute_empty(response)
  end

  def test_that_it_gets_the_list_of_categories_with_market_data
    response = @client.get_categories_with_market_data
    refute_empty(response)
  end

  def test_that_it_gets_the_list_of_asset_platforms
    response = @client.get_asset_platforms
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
