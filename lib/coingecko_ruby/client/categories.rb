module CoingeckoRuby
  class Client
    module Categories
      def get_categories
        get('coins/categories/list')
      end

      def get_categories_with_market_data
        get('coins/categories')
      end
    end
  end
end
