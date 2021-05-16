module CoingeckoRuby
  class Client
    module Prices
      # Fetches the current price for a coin in the given coin or currency.
      # @param id [String] the coin id to fetch.
      # @param currency [String] the currency to display the coin's price.
      # @option options [Boolean] :include_market_cap include market cap data.
      # @option options [Boolean] :include_24hr_vol include 24 hour volume data.
      # @option options [Boolean] :include_24hr_change include 24 hour price change data.
      # @option options [Boolean] :include_last_updated_at include last updated at value for the given coin.
      #
      # @return [Hash] returns the given coin id and its current price.
      #
      # @example Fetch the current price in USD for Bitcoin.
      #   client.get_price(id: 'bitcoin', currency: 'usd')
      # @example Response object
      #   {
      #     "bitcoin" => {
      #       "usd" => 47931 # current price in given currency
      #     }
      #   }
      # @example Fetch the current price, market cap, 24 hour volume, 24 hour price change and last updated at for Bitcoin.
      #   client.get_price(id: 'bitcoin', currency: 'usd', options: { include_market_cap: true, include_24hr_vol: true, include_24hr_change: true, include_last_updated_at: true })
      # @example Response object
      #   {
      #     "bitcoin" => {
      #       "usd" => 48217, # current price in given currency
      #       "usd_market_cap" => 905542853013.7438, # market cap in given currency
      #       "usd_24h_vol" => 66724791943.1098, # 24 hour volume in given currency
      #       "usd_24h_change" => -2.813036070702345, # 24 hour price change percentage
      #       "last_updated_at" => 1621142197 # last updated at UNIX timestamp for the given coin
      #     }
      #   }
      def get_price(id:, currency: 'usd', options: {})
        get 'simple/price', { ids: id, vs_currencies: currency, options: options }
      end

      # Fetches historical price data for a coin at a given date.
      # @param id [String] the coin id to fetch.
      # @param date [String] the date to fetch the historical price, date given must be in the form of 'DD-MM-YYYY' (e.g: '14-05-2021').
      #
      # @return [Hash] returns the coin's historical price data on the given date.
      #
      # @example Fetch Bitcoin's price on 30th December, 2017.
      #   client.get_historical_price_on_date(id: 'bitcoin', date: '30-12-2017')
      # @example Response object (truncated)
      #   {
      #     "id": "bitcoin",
      #     "symbol": "btc",
      #     "name": "Bitcoin",
      #     "localization": {
      #       "en": "Bitcoin",
      #       "de": "Bitcoin",
      #       "es": "Bitcoin",
      #       "fr": "Bitcoin",
      #       "it": "Bitcoin",
      #       "pl": "Bitcoin",
      #       "ro": "Bitcoin",
      #       "hu": "Bitcoin",
      #       "nl": "Bitcoin",
      #       "pt": "Bitcoin",
      #       "sv": "Bitcoin",
      #       "vi": "Bitcoin",
      #       "tr": "Bitcoin",
      #       "ru": "биткоин",
      #       "ja": "ビットコイン",
      #       "zh": "比特币",
      #       "zh-tw": "比特幣",
      #       "ko": "비트코인",
      #       "ar": "بيتكوين",
      #       "th": "บิตคอยน์",
      #       "id": "Bitcoin"
      #     },
      #     "image": {
      #       "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
      #       "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579"
      #     },
      #     "market_data": {
      #       "current_price": {
      #         "aed": 50024.57906376443,
      #         "ars": 253468.12429692186,
      #         "aud": 17446.3215245937,
      #         "bch": 5.76928286478153,
      #         "bdt": 1126110.803183989,
      #         "bhd": 5132.860612995706,
      #         "bmd": 13620.3618741461,
      #         "brl": 45117.7211153463,
      #         "btc": 1,
      #         "cad": 17128.871750393,
      #         "chf": 13262.4868659029,
      #         "clp": 8362902.190725706,
      #         "cny": 88573.2132675718,
      #         "czk": 289914.5782287119,
      #         "dkk": 84525.1736167662,
      #         "eth": 18.483094024188404,
      #         "eur": 11345.8976447824,
      #         "gbp": 10079.0677868681,
      #         "hkd": 106417.930376984,
      #         "huf": 3526720.3000726495,
      #         "idr": 184652192.175199,
      #         "ils": 47387.96303252911,
      #         "inr": 869671.001953725,
      #         "jpy": 1535062.45448282,
      #         "krw": 14537693.2463698,
      #         "kwd": 4104.645874754543,
      #         "lkr": 2087919.548829924,
      #         "ltc": 60.96840666846534,
      #         "mmk": 18414729.253845528,
      #         "mxn": 267888.750532982,
      #         "myr": 55317.8739192755,
      #         "ngn": 4884546.501733771,
      #         "nok": 111755.75019546246,
      #         "nzd": 19178.1505368914,
      #         "php": 680527.760679833,
      #         "pkr": 1505414.7676248574,
      #         "pln": 47450.61669715,
      #         "rub": 785377.30638701,
      #         "sar": 51079.0811004227,
      #         "sek": 111446.704184538,
      #         "sgd": 18213.1478981081,
      #         "thb": 442954.59869004245,
      #         "try": 51700.07425935065,
      #         "twd": 404053.46952093,
      #         "uah": 382908.08925747185,
      #         "usd": 13620.3618741461,
      #         "vef": 140859.73944813784,
      #         "vnd": 309201434.91677517,
      #         "xag": 804.154745877564,
      #         "xau": 10.4549897745945,
      #         "xdr": 9563.95932114975,
      #         "zar": 168771.061713303,
      #         "bits": 1000000,
      #         "link": 22041.447552365687,
      #         "sats": 100000000
      #       },
      #       "market_cap": {
      #         "aed": 839030999274.6053,
      #         "ars": 4251262431254.5815,
      #         "aud": 292616246981.057,
      #         "bch": 96764575.68919012,
      #         "bdt": 18887552682553.043,
      #         "bhd": 86090263023.8938,
      #         "bmd": 228445816988.881,
      #         "brl": 756731337692.006,
      #         "btc": 16772375,
      #         "cad": 287291860324.498,
      #         "chf": 222443403147.498,
      #         "clp": 140265731631172.94,
      #         "cny": 1485583147878.69,
      #         "czk": 4862556024018.788,
      #         "dkk": 1417687908840.51,
      #         "eth": 310005384.13394696,
      #         "eur": 190297650009.907,
      #         "gbp": 169049904571.772,
      #         "hkd": 1784881435006.67,
      #         "huf": 59151475392930.96,
      #         "idr": 3097055811734500,
      #         "ils": 794808686467.7148,
      #         "inr": 14586448171393.6,
      #         "jpy": 25746643135006.3,
      #         "krw": 243831642763082,
      #         "kwd": 68844659853.58617,
      #         "lkr": 35019369642806.27,
      #         "ltc": 1022584979.7960014,
      #         "mmk": 308858744568967.1,
      #         "mxn": 4493130582220.62,
      #         "myr": 927812125576.808,
      #         "ngn": 81925445632016.88,
      #         "nok": 1874409350684.6182,
      #         "nzd": 321663132611.194,
      #         "php": 11414066800032.4,
      #         "pkr": 25249381013141.95,
      #         "pln": 795859537225.861,
      #         "rub": 13172642699212.8,
      #         "sar": 856717502871.7015,
      #         "sek": 1869225915097.14,
      #         "sgd": 305477746477.531,
      #         "thb": 7429400637203.895,
      #         "try": 867133033005.6757,
      #         "twd": 6776936310856.11,
      #         "uah": 6422278063559.784,
      #         "usd": 228445816988.881,
      #         "vef": 2362552372426.4595,
      #         "vnd": 5186042416962243,
      #         "xag": 13487584955.8882,
      #         "xau": 175355009.120664,
      #         "xdr": 160410312219.069,
      #         "zar": 2830691536203.66,
      #         "bits": 16772375000000,
      #         "link": 369687423891.10944,
      #         "sats": 1677237500000000
      #       },
      #       "total_volume": {
      #         "aed": 13223772038.888288,
      #         "ars": 67003156399.47071,
      #         "aud": 4611856472.88116,
      #         "bch": 1525083.9259334763,
      #         "bdt": 297682315984.16693,
      #         "bhd": 1356848571.721612,
      #         "bmd": 3600481281.03768,
      #         "brl": 11926666253.0629,
      #         "btc": 264345.493482963,
      #         "cad": 4527940055.66402,
      #         "chf": 3505878635.37842,
      #         "clp": 2210695506557.1357,
      #         "cny": 23413929770.588,
      #         "czk": 76637612249.77382,
      #         "dkk": 22343848731.4572,
      #         "eth": 4885922.610916088,
      #         "eur": 2999236911.91719,
      #         "gbp": 2664356147.96788,
      #         "hkd": 28131100320.9394,
      #         "huf": 932272618099.0865,
      #         "idr": 48811974863263.9,
      #         "ils": 12526794472.986298,
      #         "inr": 229893610179.28,
      #         "jpy": 405786842057.429,
      #         "krw": 3842973695315.56,
      #         "kwd": 1085044639.3347962,
      #         "lkr": 551932123488.1709,
      #         "ltc": 16116723.547645444,
      #         "mmk": 4867850691962.943,
      #         "mxn": 70815183958.1755,
      #         "myr": 14623030679.6192,
      #         "ngn": 1291207855441.2922,
      #         "nok": 29542128934.978218,
      #         "nzd": 5069657667.76511,
      #         "php": 179894446725.766,
      #         "pkr": 397949609644.3324,
      #         "pln": 12543356686.879,
      #         "rub": 207610951627.194,
      #         "sar": 13502524900.147509,
      #         "sek": 29460434014.7115,
      #         "sgd": 4814563569.00357,
      #         "thb": 117093051981.26692,
      #         "try": 13666681643.19386,
      #         "twd": 106809713794.014,
      #         "uah": 101220027813.38469,
      #         "usd": 3600481281.03768,
      #         "vef": 37235637336.29954,
      #         "vnd": 81736005898715.08,
      #         "xag": 212574683.135671,
      #         "xau": 2763729.43132451,
      #         "xdr": 2528189546.40031,
      #         "zar": 44613869594.2467,
      #         "bits": 264345493482.963,
      #         "link": 5826557330.308955,
      #         "sats": 26434549348296.3
      #       }
      #     },
      #     "community_data": {
      #       "facebook_likes": null,
      #       "twitter_followers": 603664,
      #       "reddit_average_posts_48h": 2.042,
      #       "reddit_average_comments_48h": 445.896,
      #       "reddit_subscribers": 612412,
      #       "reddit_accounts_active_48h": "14074.0"
      #     },
      #     "developer_data": {
      #       "forks": 13660,
      #       "stars": 23665,
      #       "subscribers": 2513,
      #       "total_issues": 3591,
      #       "closed_issues": 3022,
      #       "pull_requests_merged": 5038,
      #       "pull_request_contributors": 450,
      #       "code_additions_deletions_4_weeks": {
      #         "additions": null,
      #         "deletions": null
      #       },
      #       "commit_count_4_weeks": 147
      #     },
      #     "public_interest_stats": {
      #       "alexa_rank": 2912,
      #       "bing_matches": null
      #     }
      #   }
      def get_historical_price_on_date(id:, date:)
        get("coins/#{id}/history", { query: { date: date } })
      end

      # Fetches a coin's historical price data in 5 - 10 minutes ranges.
      # @note Minutely historical data is only available within the last 24 hours.
      # @param id [String] the coin id to fetch.
      # @param currency [String] the currency used to display minutely historical price.
      #
      # @return [Hash] returns the coin's minutely historical price data within the last 24 hours.
      #
      # @example Fetch Bitcoin's minutely historical price within the last 24 hours.
      #   client.get_minutely_historical_prices(id: 'bitcoin')
      # @example Response object (truncated)
      #   {
      #     "prices" => [
      #       [1621057474114, 49364.605172521166], # [UNIX timestamp for minutely price data, coin price in given currency]
      #       [1621057731319, 49482.24672699064],
      #       [1621058047104, 49759.16253913667],
      #     ],
      #     "market_caps" => [
      #       [1621057474114, 923529491095.7441],
      #       [1621057731319, 923529491095.7441],
      #       [1621058047104, 925839705121.9677],
      #     ],
      #     "total_volumes" => [
      #       [1621057474114, 55351845301.87241],
      #       [1621057731319, 55565821585.076706],
      #       [1621058047104, 57046967935.326035],
      #     ]
      #   }
      def get_minutely_historical_prices(id:, currency: 'usd')
        get "coins/#{id}/market_chart", { id: id, vs_currency: currency, days: 1 }
      end

      # Fetches a coin's historical price data in 1 hour ranges.
      # @note Hourly historical data is only available within the last 90 days.
      # @param id [String] the coin id to fetch.
      # @param days [Integer] the number of days to fetch hourly historical prices (min: 1 day, max: 90 days)
      # @param currency [String] the currency used to display hourly historical price.
      #
      # @return [Hash] returns the coin's hourly historical price data within the number of days given.
      #
      # @example Fetch Bitcoin's hourly historical price within the last 7 days.
      #   client.get_hourly_historical_prices(id: 'bitcoin', days: 7)
      # @example Response object (truncated)
      #   {
      #     "prices" => [
      #       [1620540153122, 58533.64354969528], # [UNIX timestamp for minutely price data, coin price in given currency]
      #       [1620543723872, 58384.26782776662],
      #       [1620547381049, 58022.030773147424],
      #     ], "market_caps" => [
      #       [1620540153122, 1094831531450.288],
      #       [1620543723872, 1092040480555.5005],
      #       [1620547381049, 1085268316789.8125],
      #     ], "total_volumes" => [
      #       [1620540153122, 71975097904.11748],
      #       [1620543723872, 72192190625.33702],
      #       [1620547381049, 72064327648.28767],
      #     ]
      #   }
      def get_hourly_historical_prices(id:, days:, currency: 'usd')
        return get_daily_historical_prices(id: id, days: days) if days > 90

        get "coins/#{id}/market_chart", { vs_currency: currency, days: days }
      end

      # Fetches a coin's historical price data in daily ranges.
      # @param id [String] the coin id to fetch.
      # @param days [Integer] the number of days to fetch daily historical prices.
      # @param currency [String] the currency used to display daily historical price.
      #
      # @return [Hash] returns the coin's daily historical price data within the number of days given.
      #
      # @example Fetch Bitcoin's daily historical price within the last 14 days.
      #   client.get_daily_historical_prices(id: 'bitcoin', days: 14)
      #   {
      #     "prices" => [
      #       [1620000000000, 56600.74528738432], # [UNIX timestamp for minutely price data, coin price in given currency]
      #       [1620086400000, 57200.30029871162],
      #       [1620172800000, 53464.37021950372],
      #     ], "market_caps" => [
      #       [1620000000000, 1057850321948.5465],
      #       [1620086400000, 1069571255195.5189],
      #       [1620172800000, 999775008412.3738],
      #     ], "total_volumes" => [
      #       [1620000000000, 39072664393.929405],
      #       [1620086400000, 54132470274.07509],
      #       [1620172800000, 71296763919.13268],
      #     ]
      #   }
      def get_daily_historical_prices(id:, days:, currency: 'usd')
        get "coins/#{id}/market_chart", { vs_currency: currency, days: days, interval: 'daily' }
      end

      # Fetches a coin's open, high, low, and close (OHLC) data within the number of days given.
      # @param id [String] the coin id to fetch.
      # @param days [Integer, String] the number of days to fetch daily historical prices. Valid values: 1/7/14/30/90/180/365/'max'
      # @param currency [String] the currency to display OHLC data.
      #
      # @return [Array<Array<String, Float>>] returns the coin's OHLC data within the number of days given.
      #   If the number of days given is between 1-2 days, the OHLC data is returned in 30-minute intervals.
      #   If the number of days given is between 3-30 days, the OHLC data is returned in 4-hour intervals.
      #   If the number of days given is more than 30 days, the OHLC data is returned in 4-day intervals.
      #
      # @example Fetch Bitcoin's OHLC data in USD within the last 7 days.
      #   client.get_ohlc(id: 'bitcoin', days: 7, currency: 'usd')
      # @example Response object (truncated)
      #   [
      #     [1620547200000, 58384.27, 58384.27, 58384.27, 58384.27], # [UNIX timestamp for OHLC data, open, high, low, close]
      #     [1620561600000, 58022.03, 58214.96, 57943.18, 58048.35],
      #     [1620576000000, 57956.7, 57956.7, 56636.68, 57302.22],
      #     [1620590400000, 57396.24, 57618.74, 57396.24, 57535.26],
      #     [1620604800000, 57347.57, 58071.98, 57347.57, 58050.13],
      #     [1620619200000, 58213.93, 59005.01, 58213.93, 58909.0],
      #     [1620633600000, 59577.8, 59577.8, 58849.82, 58849.82],
      #     [1620648000000, 58495.02, 58495.02, 57878.12, 57878.12],
      #     [1620662400000, 58239.57, 58239.57, 57237.93, 57237.93],
      #     [1620676800000, 58114.79, 58114.79, 56850.29, 56850.29],
      #   ]
      def get_ohlc(id:, days:, currency: 'usd')
        get "coins/#{id}/ohlc", { vs_currency: currency, days: days }
      end

      # Fetches the list of currencies currently supported by CoinGecko's API.
      #
      # @return [Array<String>] returns the list of currencies currently supported by CoinGecko's API.
      #
      # @example Fetch supported currencies.
      #   client.supported_currencies
      # @example Response object
      #   [
      #     "btc",
      #     "eth",
      #     "ltc",
      #     "bch",
      #     "bnb",
      #     "eos",
      #     "xrp",
      #     "xlm",
      #     "link",
      #     "dot",
      #     "yfi",
      #     "usd",
      #     "aed",
      #     "ars",
      #     "aud",
      #     "bdt",
      #     "bhd",
      #     "bmd",
      #     "brl",
      #     "cad",
      #     "chf",
      #     "clp",
      #     "cny",
      #     "czk",
      #     "dkk",
      #     "eur",
      #     "gbp",
      #     "hkd",
      #     "huf",
      #     "idr",
      #     "ils",
      #     "inr",
      #     "jpy",
      #     "krw",
      #     "kwd",
      #     "lkr",
      #     "mmk",
      #     "mxn",
      #     "myr",
      #     "ngn",
      #     "nok",
      #     "nzd",
      #     "php",
      #     "pkr",
      #     "pln",
      #     "rub",
      #     "sar",
      #     "sek",
      #     "sgd",
      #     "thb",
      #     "try",
      #     "twd",
      #     "uah",
      #     "vef",
      #     "vnd",
      #     "zar",
      #     "xdr",
      #     "xag",
      #     "xau",
      #     "bits",
      #     "sats"
      #   ]
      def supported_currencies
        get('simple/supported_vs_currencies')
      end

      # Fetches the exchange rate for a coin or currency in the given coin or currency.
      # @param from [String] the coin id or currency to be converted.
      # @param to [String] the coin id or currency to convert against.
      #
      # @return [Hash] returns the coin's exchange rate against the given coin or currency.
      #
      # @example Fetch the exchange rate for BTC-USD.
      #   client.get_exchange_rate(from: 'bitcoin', to: 'usd')
      # @example Response object
      #   {
      #     "bitcoin" => {
      #       "usd" => 47931 # current price in given currency
      #     }
      #   }
      # @example Fetch the exchange rate for BTC-ETH.
      #   client.get_exchange_rate(from: 'bitcoin', to: 'eth')
      # @example Response object
      #   {
      #     "bitcoin" => {
      #       "eth" => 12.71434 # current price in given currency
      #     }
      #   }
      def get_exchange_rate(from:, to: 'usd')
        get_price(id: from, currency: to)
      end
    end
  end
end
