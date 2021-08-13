require 'test_helper'

class TestCategories < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_the_list_of_categories
    response = @client.categories
    data = response[0]
    assert_includes data, 'category_id'
    assert_includes data, 'name'
  end

  def test_that_it_gets_the_list_of_categories_with_market_data
    response = @client.categories_with_market_data
    data = response[0]
    assert_includes data, 'id'
    assert_includes data, 'name'
    assert_includes data, 'market_cap'
    assert_includes data, 'volume_24h'
  end

  def test_that_it_gets_the_list_of_asset_platforms
    response = @client.asset_platforms
    data = response[0]
    assert_includes data, 'id'
    assert_includes data, 'name'
  end

  def teardown
    VCR.eject_cassette
  end
end
