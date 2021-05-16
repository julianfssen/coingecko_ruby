module CoingeckoRuby
  class Client
    module Exchanges
      # Fetches complete data for every exchange currently supported by the CoinGecko API.
      #
      # @option options [Integer] :per_page (100) sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      #
      # @return [Array<Hash>] returns an array of hashes of detailed exchange data.
      #
      # @example Fetch complete exchange data with 2 results per page.
      #   client.get_exchanges(options: { per_page: 2 })
      # @example Response object
      #   [{
      #     "id" => "binance",
      #     "name" => "Binance",
      #     "year_established" => 2017,
      #     "country" => "Cayman Islands",
      #     "description" => "",
      #     "url" => "https://www.binance.com/",
      #     "image" => "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
      #     "has_trading_incentive" => false,
      #     "trust_score" => 10,
      #     "trust_score_rank" => 1,
      #     "trade_volume_24h_btc" => 982949.3975723931,
      #     "trade_volume_24h_btc_normalized" => 982949.3975723931
      #   }, {
      #     "id" => "gdax",
      #     "name" => "Coinbase Pro",
      #     "year_established" => 2012,
      #     "country" => "United States",
      #     "description" => "",
      #     "url" => "https://www.coinbase.com",
      #     "image" => "https://assets.coingecko.com/markets/images/23/small/fe290a14-ac8f-4c90-9aed-5e72abf271f0.jpeg?1527171545",
      #     "has_trading_incentive" => false,
      #     "trust_score" => 10,
      #     "trust_score_rank" => 2,
      #     "trade_volume_24h_btc" => 153732.65763353973,
      #     "trade_volume_24h_btc_normalized" => 153732.65763353973
      #   }]
      def get_exchanges(options: {})
        get 'exchanges', { options: options }
      end

      # Fetches complete data for a specific exchange.
      #
      # @param id [String] the exchange id to fetch.
      #
      # @return [Hash] returns detailed data for the given exchange.
      #
      # @example Fetch complete exchange data for Binance.
      #   client.get_exchange_data(id: 'binance')
      def get_exchange_data(id:)
        get "exchanges/#{id}"
      end

      # Fetches exchange ids for every exchange currently supported by the CoinGecko API.
      #
      # @return [Array<Hash>] returns an array of hashes of the exchange id and name.
      #
      # @example Fetch all exchange ids.
      #   client.get_exchange_ids
      # @example Response object
      #   [{
      #     "id" => "aave",
      #     "name" => "Aave"
      #   }, {
      #     "id" => "aax",
      #     "name" => "AAX"
      #   }, {
      #     "id" => "aax_futures",
      #     "name" => "AAX Futures"
      #   }, {
      #     "id" => "abcc",
      #     "name" => "ABCC"
      #   }, {
      #     "id" => "abit",
      #     "name" => "Abit"
      #   }, {
      #     "id" => "acdx",
      #     "name" => "ACDX"
      #   }, {
      #     "id" => "acdx_futures",
      #     "name" => "ACDX Futures"
      #   }, {
      #     "id" => "aex",
      #     "name" => "AEX"
      #   }, {
      #     "id" => "allbit",
      #     "name" => "Allbit"
      #   }, {
      #     "id" => "allcoin",
      #     "name" => "Allcoin"
      #   }, {
      #     "id" => "alpha_five",
      #     "name" => "Alpha5"
      #   }, {
      #     "id" => "altcointrader",
      #     "name" => "AltcoinTrader"
      #   }, {
      #     "id" => "alterdice",
      #     "name" => "AlterDice"
      #   }, {
      #     "id" => "altilly",
      #     "name" => "Altilly"
      #   }, {
      #     "id" => "altmarkets",
      #     "name" => "Altmarkets"
      #   }, {
      #     "id" => "anyswap",
      #     "name" => "Anyswap"
      #   }, {
      #     "id" => "apeswap",
      #     "name" => "ApeSwap"
      #   }, {
      #     "id" => "aprobit",
      #     "name" => "Aprobit"
      #   }, {
      #     "id" => "artisturba",
      #     "name" => "Artis Turba"
      #   }, {
      #     "id" => "atomars",
      #     "name" => "Atomars"
      #   }, {
      #     "id" => "b2bx",
      #     "name" => "B2BX"
      #   }, {
      #     "id" => "bakeryswap",
      #     "name" => "Bakeryswap"
      #   }, {
      #     "id" => "bakkt",
      #     "name" => "Bakkt"
      #   }, {
      #     "id" => "balancer",
      #     "name" => "Balancer (v2)"
      #   }, {
      #     "id" => "balancer_v1",
      #     "name" => "Balancer (v1)"
      #   }, {
      #     "id" => "bamboo_relay",
      #     "name" => "Bamboo Relay"
      #   }, {
      #     "id" => "bancor",
      #     "name" => "Bancor Network"
      #   }, {
      #     "id" => "bankera",
      #     "name" => "Bankera"
      #   }, {
      #     "id" => "basefex",
      #     "name" => "BaseFEX"
      #   }, {
      #     "id" => "bcex",
      #     "name" => "BCEX"
      #   }, {
      #     "id" => "beaxy",
      #     "name" => "Beaxy"
      #   }, {
      #     "id" => "bepswap",
      #     "name" => "BepSwap"
      #   }, {
      #     "id" => "bgogo",
      #     "name" => "Bgogo"
      #   }, {
      #     "id" => "bibo",
      #     "name" => "Bibo"
      #   }, {
      #     "id" => "bibox",
      #     "name" => "Bibox"
      #   }, {
      #     "id" => "bibox_futures",
      #     "name" => "Bibox (Futures)"
      #   }, {
      #     "id" => "biconomy",
      #     "name" => "Biconomy"
      #   }, {
      #     "id" => "bidesk",
      #     "name" => "Bidesk"
      #   }, {
      #     "id" => "bigone",
      #     "name" => "BigONE"
      #   }, {
      #     "id" => "bigone_futures",
      #     "name" => "BigONE Futures"
      #   }, {
      #     "id" => "biki",
      #     "name" => "BiKi"
      #   }, {
      #     "id" => "biki_futures",
      #     "name" => "Biki (Futures)"
      #   }, {
      #     "id" => "bilaxy",
      #     "name" => "Bilaxy"
      #   }, {
      #     "id" => "binance",
      #     "name" => "Binance"
      #   }, {
      #     "id" => "binance_dex",
      #     "name" => "Binance DEX"
      #   }, {
      #     "id" => "binance_dex_mini",
      #     "name" => "Binance DEX (Mini)"
      #   }, {
      #     "id" => "binance_futures",
      #     "name" => "Binance (Futures)"
      #   }, {
      #     "id" => "binance_jersey",
      #     "name" => "Binance Jersey"
      #   }, {
      #     "id" => "binance_us",
      #     "name" => "Binance US"
      #   }, {
      #     "id" => "bione",
      #     "name" => "BiONE"
      #   }, {
      #     "id" => "birake",
      #     "name" => "Birake"
      #   }, {
      #     "id" => "bisq",
      #     "name" => "Bisq"
      #   }, {
      #     "id" => "bit2c",
      #     "name" => "Bit2c"
      #   }, {
      #     "id" => "bitalong",
      #     "name" => "Bitalong"
      #   }, {
      #     "id" => "bitbank",
      #     "name" => "Bitbank"
      #   }, {
      #     "id" => "bitbay",
      #     "name" => "BitBay"
      #   }, {
      #     "id" => "bitbns",
      #     "name" => "BitBNS"
      #   }, {
      #     "id" => "bitbox",
      #     "name" => "BITFRONT"
      #   }, {
      #     "id" => "bitci",
      #     "name" => "Bitci"
      #   }, {
      #     "id" => "bitcoin_com",
      #     "name" => "Bitcoin.com Exchange"
      #   }, {
      #     "id" => "bit_com_futures",
      #     "name" => "Bit.com"
      #   }, {
      #     "id" => "bitcratic",
      #     "name" => "Bitcratic"
      #   }, {
      #     "id" => "bitex",
      #     "name" => "Bitex.la"
      #   }, {
      #     "id" => "bitexbook",
      #     "name" => "BITEXBOOK"
      #   }, {
      #     "id" => "bitexlive",
      #     "name" => "Bitexlive"
      #   }, {
      #     "id" => "bitfex",
      #     "name" => "Bitfex"
      #   }, {
      #     "id" => "bitfinex",
      #     "name" => "Bitfinex"
      #   }, {
      #     "id" => "bitfinex_futures",
      #     "name" => "Bitfinex (Futures)"
      #   }, {
      #     "id" => "bitflyer",
      #     "name" => "bitFlyer"
      #   }, {
      #     "id" => "bitflyer_futures",
      #     "name" => "Bitflyer (Futures)"
      #   }, {
      #     "id" => "bitforex",
      #     "name" => "Bitforex"
      #   }, {
      #     "id" => "bitforex_futures",
      #     "name" => "Bitforex (Futures)"
      #   }, {
      #     "id" => "bitget",
      #     "name" => "Bitget"
      #   }, {
      #     "id" => "bitget_futures",
      #     "name" => "Bitget Futures"
      #   }, {
      #     "id" => "bithash",
      #     "name" => "BitHash"
      #   }, {
      #     "id" => "bitholic",
      #     "name" => "Bithumb Singapore"
      #   }, {
      #     "id" => "bithumb",
      #     "name" => "Bithumb"
      #   }, {
      #     "id" => "bithumb_futures",
      #     "name" => "Bithumb (Futures)"
      #   }, {
      #     "id" => "bithumb_global",
      #     "name" => "Bithumb Global"
      #   }, {
      #     "id" => "bitinfi",
      #     "name" => "Bitinfi"
      #   }, {
      #     "id" => "bitkonan",
      #     "name" => "BitKonan"
      #   }, {
      #     "id" => "bitkub",
      #     "name" => "Bitkub"
      #   }, {
      #     "id" => "bitmart",
      #     "name" => "BitMart"
      #   }, {
      #     "id" => "bitmax",
      #     "name" => "AscendEX (BitMax)"
      #   }, {
      #     "id" => "bitmax_futures",
      #     "name" => "AscendEX  (BitMax) (Futures)"
      #   }, {
      #     "id" => "bitmesh",
      #     "name" => "Bitmesh"
      #   }, {
      #     "id" => "bitmex",
      #     "name" => "BitMEX"
      #   }, {
      #     "id" => "bitoffer",
      #     "name" => "Bitoffer"
      #   }, {
      #     "id" => "bitonbay",
      #     "name" => "BitOnBay"
      #   }, {
      #     "id" => "bitopro",
      #     "name" => "BitoPro"
      #   }, {
      #     "id" => "bitpanda",
      #     "name" => "Bitpanda Pro"
      #   }, {
      #     "id" => "bitrabbit",
      #     "name" => "BitRabbit"
      #   }, {
      #     "id" => "bitrue",
      #     "name" => "Bitrue"
      #   }, {
      #     "id" => "bits_blockchain",
      #     "name" => "Bits Blockchain"
      #   }, {
      #     "id" => "bitsdaq",
      #     "name" => "Bitsdaq"
      #   }, {
      #     "id" => "bitso",
      #     "name" => "Bitso"
      #   }, {
      #     "id" => "bitsonic",
      #     "name" => "Bitsonic"
      #   }, {
      #     "id" => "bitstamp",
      #     "name" => "Bitstamp"
      #   }, {
      #     "id" => "bitsten",
      #     "name" => "Bitsten"
      #   }, {
      #     "id" => "bitstorage",
      #     "name" => "BitStorage"
      #   }, {
      #     "id" => "bittrex",
      #     "name" => "Bittrex"
      #   }, {
      #     "id" => "bitubu",
      #     "name" => "Bitubu Exchange"
      #   }, {
      #     "id" => "bit_z",
      #     "name" => "BitZ"
      #   }, {
      #     "id" => "bitz_futures",
      #     "name" => "BitZ (Futures)"
      #   }, {
      #     "id" => "bkex",
      #     "name" => "BKEX"
      #   }, {
      #     "id" => "bleutrade",
      #     "name" => "bleutrade"
      #   }, {
      #     "id" => "blockchain_com",
      #     "name" => "Blockchain.com"
      #   }, {
      #     "id" => "blockonix",
      #     "name" => "Blockonix"
      #   }, {
      #     "id" => "boa",
      #     "name" => "BOA Exchange"
      #   }, {
      #     "id" => "braziliex",
      #     "name" => "Braziliex"
      #   }, {
      #     "id" => "bscswap",
      #     "name" => "BSCswap"
      #   }, {
      #     "id" => "btc_alpha",
      #     "name" => "BTC-Alpha"
      #   }, {
      #     "id" => "btcbox",
      #     "name" => "BTCBOX"
      #   }, {
      #     "id" => "btcc",
      #     "name" => "BTCC"
      #   }, {
      #     "id" => "btc_exchange",
      #     "name" => "Btc Exchange"
      #   }, {
      #     "id" => "btcmarkets",
      #     "name" => "BTCMarkets"
      #   }, {
      #     "id" => "btcmex",
      #     "name" => "BTCMEX"
      #   }, {
      #     "id" => "btcnext",
      #     "name" => "BTCNEXT"
      #   }, {
      #     "id" => "btcsquare",
      #     "name" => "BTCSquare"
      #   }, {
      #     "id" => "btc_trade_ua",
      #     "name" => "BTC Trade UA"
      #   }, {
      #     "id" => "btcturk",
      #     "name" => "BtcTurk PRO"
      #   }, {
      #     "id" => "btse",
      #     "name" => "BTSE"
      #   }, {
      #     "id" => "btse_futures",
      #     "name" => "BTSE (Futures)"
      #   }, {
      #     "id" => "burgerswap",
      #     "name" => "BurgerSwap"
      #   }, {
      #     "id" => "buyucoin",
      #     "name" => "BuyUcoin"
      #   }, {
      #     "id" => "bvnex",
      #     "name" => "Bvnex"
      #   }, {
      #     "id" => "bw",
      #     "name" => "BW.com"
      #   }, {
      #     "id" => "bybit",
      #     "name" => "Bybit"
      #   }, {
      #     "id" => "c2cx",
      #     "name" => "C2CX"
      #   }, {
      #     "id" => "catex",
      #     "name" => "Catex"
      #   }, {
      #     "id" => "cbx",
      #     "name" => "CBX"
      #   }, {
      #     "id" => "ccex",
      #     "name" => "C-CEX"
      #   }, {
      #     "id" => "cex",
      #     "name" => "CEX.IO"
      #   }, {
      #     "id" => "chainex",
      #     "name" => "ChainEX"
      #   }, {
      #     "id" => "changelly",
      #     "name" => "Changelly PRO"
      #   }, {
      #     "id" => "chiliz",
      #     "name" => "Chiliz"
      #   }, {
      #     "id" => "citex",
      #     "name" => "CITEX"
      #   }, {
      #     "id" => "cme_futures",
      #     "name" => "CME Bitcoin Futures"
      #   }, {
      #     "id" => "coinasset",
      #     "name" => "CoinAsset"
      #   }, {
      #     "id" => "coinbene",
      #     "name" => "CoinBene"
      #   }, {
      #     "id" => "coinbig",
      #     "name" => "COINBIG"
      #   }, {
      #     "id" => "coinbit",
      #     "name" => "Coinbit"
      #   }, {
      #     "id" => "coincheck",
      #     "name" => "Coincheck"
      #   }, {
      #     "id" => "coindcx",
      #     "name" => "CoinDCX"
      #   }, {
      #     "id" => "coindeal",
      #     "name" => "Coindeal"
      #   }, {
      #     "id" => "coindirect",
      #     "name" => "CoinDirect"
      #   }, {
      #     "id" => "coineal",
      #     "name" => "Coineal"
      #   }, {
      #     "id" => "coin_egg",
      #     "name" => "CoinEgg"
      #   }, {
      #     "id" => "coinex",
      #     "name" => "CoinEx"
      #   }, {
      #     "id" => "coinfalcon",
      #     "name" => "Coinfalcon"
      #   }, {
      #     "id" => "coinfield",
      #     "name" => "Coinfield"
      #   }, {
      #     "id" => "coinflex",
      #     "name" => "CoinFLEX"
      #   }, {
      #     "id" => "coinflex_futures",
      #     "name" => "CoinFLEX (Futures)"
      #   }, {
      #     "id" => "coinfloor",
      #     "name" => "Coinfloor"
      #   }, {
      #     "id" => "coingi",
      #     "name" => "Coingi"
      #   }, {
      #     "id" => "coinhe",
      #     "name" => "CoinHe"
      #   }, {
      #     "id" => "coinhub",
      #     "name" => "Coinhub"
      #   }, {
      #     "id" => "coinjar",
      #     "name" => "CoinJar Exchange"
      #   }, {
      #     "id" => "coinlim",
      #     "name" => "Coinlim"
      #   }, {
      #     "id" => "coinlist",
      #     "name" => "Coinlist"
      #   }, {
      #     "id" => "coinmargin",
      #     "name" => "CoinMargin"
      #   }, {
      #     "id" => "coin_metro",
      #     "name" => "CoinMetro"
      #   }, {
      #     "id" => "coinone",
      #     "name" => "Coinone"
      #   }, {
      #     "id" => "coinpark",
      #     "name" => "Coinpark"
      #   }, {
      #     "id" => "coinplace",
      #     "name" => "Coinplace"
      #   }, {
      #     "id" => "coinsbank",
      #     "name" => "Coinsbank"
      #   }, {
      #     "id" => "coinsbit",
      #     "name" => "Coinsbit"
      #   }, {
      #     "id" => "coinsuper",
      #     "name" => "Coinsuper"
      #   }, {
      #     "id" => "cointiger",
      #     "name" => "CoinTiger"
      #   }, {
      #     "id" => "cointiger_futures",
      #     "name" => "CoinTiger (Futures)"
      #   }, {
      #     "id" => "coinxpro",
      #     "name" => "COINX.PRO"
      #   }, {
      #     "id" => "coinzo",
      #     "name" => "Coinzo"
      #   }, {
      #     "id" => "coinzoom",
      #     "name" => "Coinzoom"
      #   }, {
      #     "id" => "comethswap",
      #     "name" => "ComethSwap"
      #   }, {
      #     "id" => "compound_finance",
      #     "name" => "Compound Finance"
      #   }, {
      #     "id" => "c_patex",
      #     "name" => "C-Patex"
      #   }, {
      #     "id" => "cpdax",
      #     "name" => "CPDAX"
      #   }, {
      #     "id" => "crex24",
      #     "name" => "CREX24"
      #   }, {
      #     "id" => "crxzone",
      #     "name" => "CRXzone"
      #   }, {
      #     "id" => "cryptaldash",
      #     "name" => "CryptalDash"
      #   }, {
      #     "id" => "cryptex",
      #     "name" => "Cryptex"
      #   }, {
      #     "id" => "cryptlocex",
      #     "name" => "Cryptlocex"
      #   }, {
      #     "id" => "crypto_com",
      #     "name" => "Crypto.com"
      #   }, {
      #     "id" => "crypto_com_futures",
      #     "name" => "Crypto.com (Futures)"
      #   }, {
      #     "id" => "cryptology",
      #     "name" => "Cryptology"
      #   }, {
      #     "id" => "crytrex",
      #     "name" => "CryTrEx"
      #   }, {
      #     "id" => "c_trade",
      #     "name" => "C-Trade"
      #   }, {
      #     "id" => "currency",
      #     "name" => "Currency.com"
      #   }, {
      #     "id" => "curve",
      #     "name" => "Curve Finance"
      #   }, {
      #     "id" => "cybex",
      #     "name" => "Cybex DEX"
      #   }, {
      #     "id" => "daofi",
      #     "name" => "DAOfi"
      #   }, {
      #     "id" => "darb_finance",
      #     "name" => "Darb Finance"
      #   }, {
      #     "id" => "daybit",
      #     "name" => "Daybit"
      #   }, {
      #     "id" => "dcoin",
      #     "name" => "Dcoin"
      #   }, {
      #     "id" => "ddex",
      #     "name" => "DDEX"
      #   }, {
      #     "id" => "decoin",
      #     "name" => "Decoin"
      #   }, {
      #     "id" => "defi_swap",
      #     "name" => "DeFi Swap"
      #   }, {
      #     "id" => "delta_futures",
      #     "name" => "Delta Exchange (Futures)"
      #   }, {
      #     "id" => "delta_spot",
      #     "name" => "Delta Exchange"
      #   }, {
      #     "id" => "dem_exchange",
      #     "name" => "Demex"
      #   }, {
      #     "id" => "deribit",
      #     "name" => "Deribit"
      #   }, {
      #     "id" => "deversifi",
      #     "name" => "Deversifi "
      #   }, {
      #     "id" => "dex_blue",
      #     "name" => "dex.blue"
      #   }, {
      #     "id" => "dextrade",
      #     "name" => "Dex-Trade"
      #   }, {
      #     "id" => "digifinex",
      #     "name" => "Digifinex"
      #   }, {
      #     "id" => "dmm",
      #     "name" => "DMM"
      #   }, {
      #     "id" => "dobitrade",
      #     "name" => "Dobitrade"
      #   }, {
      #     "id" => "dodo",
      #     "name" => "DODO"
      #   }, {
      #     "id" => "dodo_bsc",
      #     "name" => "Dodo BSC"
      #   }, {
      #     "id" => "dolomite",
      #     "name" => "Dolomite"
      #   }, {
      #     "id" => "dove_wallet",
      #     "name" => "Dove Wallet"
      #   }, {
      #     "id" => "dragonex",
      #     "name" => "DragonEx"
      #   }, {
      #     "id" => "dsx",
      #     "name" => "DSX Global"
      #   }, {
      #     "id" => "duedex",
      #     "name" => "DueDEX"
      #   }, {
      #     "id" => "dydx",
      #     "name" => "dYdX"
      #   }, {
      #     "id" => "dydx_perpetual",
      #     "name" => "dYdX Perpetual"
      #   }, {
      #     "id" => "dydx_perpetual_l1",
      #     "name" => "dYdX Perpetual (L1)"
      #   }, {
      #     "id" => "ecxx",
      #     "name" => "Ecxx"
      #   }, {
      #     "id" => "elitex",
      #     "name" => "Elitex"
      #   }, {
      #     "id" => "emirex",
      #     "name" => "Emirex"
      #   }, {
      #     "id" => "equos",
      #     "name" => "Equos.io"
      #   }, {
      #     "id" => "equos_perpetual",
      #     "name" => "Equos.io (Perpetual)"
      #   }, {
      #     "id" => "eterbase",
      #     "name" => "Eterbase"
      #   }, {
      #     "id" => "etherflyer",
      #     "name" => "EtherFlyer"
      #   }, {
      #     "id" => "ethex",
      #     "name" => "Ethex"
      #   }, {
      #     "id" => "etorox",
      #     "name" => "eToroX"
      #   }, {
      #     "id" => "everbloom",
      #     "name" => "Everbloom"
      #   }, {
      #     "id" => "exmarkets",
      #     "name" => "ExMarkets"
      #   }, {
      #     "id" => "exmo",
      #     "name" => "EXMO"
      #   }, {
      #     "id" => "exnce",
      #     "name" => "EXNCE"
      #   }, {
      #     "id" => "exrates",
      #     "name" => "Exrates"
      #   }, {
      #     "id" => "exx",
      #     "name" => "EXX"
      #   }, {
      #     "id" => "fatbtc",
      #     "name" => "FatBTC"
      #   }, {
      #     "id" => "fex",
      #     "name" => "FEX"
      #   }, {
      #     "id" => "financex",
      #     "name" => "FinanceX"
      #   }, {
      #     "id" => "finexbox",
      #     "name" => "FinexBox"
      #   }, {
      #     "id" => "floatsv",
      #     "name" => "Float SV"
      #   }, {
      #     "id" => "flybit",
      #     "name" => "Flybit"
      #   }, {
      #     "id" => "forkdelta",
      #     "name" => "ForkDelta"
      #   }, {
      #     "id" => "freiexchange",
      #     "name" => "Freiexchange"
      #   }, {
      #     "id" => "ftx",
      #     "name" => "FTX (Derivatives)"
      #   }, {
      #     "id" => "ftx_spot",
      #     "name" => "FTX"
      #   }, {
      #     "id" => "ftx_us",
      #     "name" => "FTX.US"
      #   }, {
      #     "id" => "futureswap",
      #     "name" => "Futureswap"
      #   }, {
      #     "id" => "gate",
      #     "name" => "Gate.io"
      #   }, {
      #     "id" => "gate_futures",
      #     "name" => "Gate.io (Futures)"
      #   }, {
      #     "id" => "gbx",
      #     "name" => "Global Blockchain Exchange"
      #   }, {
      #     "id" => "gdac",
      #     "name" => "GDAC"
      #   }, {
      #     "id" => "gdax",
      #     "name" => "Coinbase Pro"
      #   }, {
      #     "id" => "gemini",
      #     "name" => "Gemini"
      #   }, {
      #     "id" => "getbtc",
      #     "name" => "GetBTC"
      #   }, {
      #     "id" => "gmo_japan",
      #     "name" => "GMO Japan"
      #   }, {
      #     "id" => "gmo_japan_futures",
      #     "name" => "GMO Japan (Futures)"
      #   }, {
      #     "id" => "gobaba",
      #     "name" => "Gobaba"
      #   }, {
      #     "id" => "goku",
      #     "name" => "GokuMarket"
      #   }, {
      #     "id" => "gopax",
      #     "name" => "GoPax"
      #   }, {
      #     "id" => "graviex",
      #     "name" => "Graviex"
      #   }, {
      #     "id" => "hanbitco",
      #     "name" => "Hanbitco"
      #   }, {
      #     "id" => "hbtc",
      #     "name" => "BHEX"
      #   }, {
      #     "id" => "hbtc_futures",
      #     "name" => "HBTC (Futures)"
      #   }, {
      #     "id" => "hb_top",
      #     "name" => "Hb.top"
      #   }, {
      #     "id" => "hitbtc",
      #     "name" => "HitBTC"
      #   }, {
      #     "id" => "honeyswap",
      #     "name" => "Honeyswap"
      #   }, {
      #     "id" => "hoo",
      #     "name" => "Hoo.com"
      #   }, {
      #     "id" => "hopex",
      #     "name" => "Hopex"
      #   }, {
      #     "id" => "hotbit",
      #     "name" => "Hotbit"
      #   }, {
      #     "id" => "hpx",
      #     "name" => "HPX"
      #   }, {
      #     "id" => "hubi",
      #     "name" => "Hubi"
      #   }, {
      #     "id" => "huobi",
      #     "name" => "Huobi Global"
      #   }, {
      #     "id" => "huobi_dm",
      #     "name" => "Huobi Futures"
      #   }, {
      #     "id" => "huobi_id",
      #     "name" => "Huobi Indonesia"
      #   }, {
      #     "id" => "huobi_japan",
      #     "name" => "Huobi Japan"
      #   }, {
      #     "id" => "huobi_korea",
      #     "name" => "Huobi Korea"
      #   }, {
      #     "id" => "huobi_thailand",
      #     "name" => "Huobi Thailand"
      #   }, {
      #     "id" => "ice3x",
      #     "name" => "Ice3x"
      #   }, {
      #     "id" => "idcm",
      #     "name" => "IDCM"
      #   }, {
      #     "id" => "idex",
      #     "name" => "Idex"
      #   }, {
      #     "id" => "incorex",
      #     "name" => "IncoreX"
      #   }, {
      #     "id" => "independent_reserve",
      #     "name" => "Independent Reserve"
      #   }, {
      #     "id" => "indodax",
      #     "name" => "Indodax"
      #   }, {
      #     "id" => "infinity_coin",
      #     "name" => "Infinity Coin"
      #   }, {
      #     "id" => "instantbitex",
      #     "name" => "Instant Bitex"
      #   }, {
      #     "id" => "iqfinex",
      #     "name" => "IQFinex"
      #   }, {
      #     "id" => "itbit",
      #     "name" => "itBit"
      #   }, {
      #     "id" => "jex",
      #     "name" => "Binance JEX"
      #   }, {
      #     "id" => "jex_futures",
      #     "name" => "Binance JEX (Futures)"
      #   }, {
      #     "id" => "joyso",
      #     "name" => "Joyso"
      #   }, {
      #     "id" => "julswap",
      #     "name" => "Julswap"
      #   }, {
      #     "id" => "justswap",
      #     "name" => "JustSwap"
      #   }, {
      #     "id" => "kickex",
      #     "name" => "KickEX"
      #   }, {
      #     "id" => "kkcoin",
      #     "name" => "KKCoin"
      #   }, {
      #     "id" => "k_kex",
      #     "name" => "KKEX"
      #   }, {
      #     "id" => "korbit",
      #     "name" => "Korbit"
      #   }, {
      #     "id" => "kraken",
      #     "name" => "Kraken"
      #   }, {
      #     "id" => "kraken_futures",
      #     "name" => "Kraken (Futures)"
      #   }, {
      #     "id" => "kucoin",
      #     "name" => "KuCoin"
      #   }, {
      #     "id" => "kumex",
      #     "name" => "KuCoin Futures"
      #   }, {
      #     "id" => "kuna",
      #     "name" => "Kuna Exchange"
      #   }, {
      #     "id" => "kyber_network",
      #     "name" => "Kyber Network"
      #   }, {
      #     "id" => "lakebtc",
      #     "name" => "LakeBTC"
      #   }, {
      #     "id" => "latoken",
      #     "name" => "LATOKEN"
      #   }, {
      #     "id" => "lbank",
      #     "name" => "LBank"
      #   }, {
      #     "id" => "lcx",
      #     "name" => "LCX Exchange"
      #   }, {
      #     "id" => "leverj",
      #     "name" => "Leverj"
      #   }, {
      #     "id" => "linkswap",
      #     "name" => "Linkswap"
      #   }, {
      #     "id" => "liquid_derivatives",
      #     "name" => "Liquid Perpetuals"
      #   }, {
      #     "id" => "localtrade",
      #     "name" => "LocalTrade"
      #   }, {
      #     "id" => "loopring",
      #     "name" => "Loopring"
      #   }, {
      #     "id" => "loopring_amm",
      #     "name" => "Loopring AMM"
      #   }, {
      #     "id" => "luaswap",
      #     "name" => "Luaswap"
      #   }, {
      #     "id" => "lucent",
      #     "name" => "Lucent"
      #   }, {
      #     "id" => "lukki",
      #     "name" => "Lukki"
      #   }, {
      #     "id" => "luno",
      #     "name" => "Luno"
      #   }, {
      #     "id" => "lykke",
      #     "name" => "Lykke"
      #   }, {
      #     "id" => "max_maicoin",
      #     "name" => "Max Maicoin"
      #   }, {
      #     "id" => "mcdex",
      #     "name" => "MCDEX"
      #   }, {
      #     "id" => "mdex",
      #     "name" => "Mdex"
      #   }, {
      #     "id" => "mercado_bitcoin",
      #     "name" => "Mercado Bitcoin"
      #   }, {
      #     "id" => "mercatox",
      #     "name" => "Mercatox"
      #   }, {
      #     "id" => "mercuriex",
      #     "name" => "MercuriEx"
      #   }, {
      #     "id" => "mesa",
      #     "name" => " Gnosis Protocol"
      #   }, {
      #     "id" => "mirror",
      #     "name" => "Terraswap"
      #   }, {
      #     "id" => "mooniswap",
      #     "name" => "Mooniswap"
      #   }, {
      #     "id" => "multi",
      #     "name" => "Multi.io"
      #   }, {
      #     "id" => "mxc",
      #     "name" => "MXC"
      #   }, {
      #     "id" => "mxc_futures",
      #     "name" => "MXC (Futures)"
      #   }, {
      #     "id" => "mycoinstory",
      #     "name" => "MyCoinStory"
      #   }, {
      #     "id" => "namebase",
      #     "name" => "Namebase"
      #   }, {
      #     "id" => "nami_exchange",
      #     "name" => "Nami.Exchange"
      #   }, {
      #     "id" => "nanu_exchange",
      #     "name" => "Nanu Exchange"
      #   }, {
      #     "id" => "narkasa",
      #     "name" => "Narkasa"
      #   }, {
      #     "id" => "nash",
      #     "name" => "Nash"
      #   }, {
      #     "id" => "neblidex",
      #     "name" => "Neblidex"
      #   }, {
      #     "id" => "negociecoins",
      #     "name" => "Negociecoins"
      #   }, {
      #     "id" => "neraex",
      #     "name" => "Neraex"
      #   }, {
      #     "id" => "newdex",
      #     "name" => "Newdex"
      #   }, {
      #     "id" => "nexus_mutual",
      #     "name" => "Nexus Mutual"
      #   }, {
      #     "id" => "nice_hash",
      #     "name" => "NiceHash"
      #   }, {
      #     "id" => "niftex",
      #     "name" => "Niftex"
      #   }, {
      #     "id" => "nlexch",
      #     "name" => "NLexch"
      #   }, {
      #     "id" => "nominex",
      #     "name" => "Nominex"
      #   }, {
      #     "id" => "novadax",
      #     "name" => "NovaDAX"
      #   }, {
      #     "id" => "oasis_trade",
      #     "name" => "OasisDEX"
      #   }, {
      #     "id" => "oceanex",
      #     "name" => "Oceanex"
      #   }, {
      #     "id" => "okcoin",
      #     "name" => "Okcoin"
      #   }, {
      #     "id" => "okex",
      #     "name" => "OKEx"
      #   }, {
      #     "id" => "okex_swap",
      #     "name" => "OKEx (Futures)"
      #   }, {
      #     "id" => "omgfin",
      #     "name" => "Omgfin"
      #   }, {
      #     "id" => "omnitrade",
      #     "name" => "OmniTrade"
      #   }, {
      #     "id" => "one_inch",
      #     "name" => "1inch"
      #   }, {
      #     "id" => "one_inch_liquidity_protocol",
      #     "name" => "1inch Liquidity Protocol"
      #   }, {
      #     "id" => "one_inch_liquidity_protocol_bsc",
      #     "name" => "1inch Liquidity Protocol (BSC)"
      #   }, {
      #     "id" => "orderbook",
      #     "name" => "Orderbook.io"
      #   }, {
      #     "id" => "otcbtc",
      #     "name" => "OTCBTC"
      #   }, {
      #     "id" => "ovex",
      #     "name" => "Ovex"
      #   }, {
      #     "id" => "p2pb2b",
      #     "name" => "P2PB2B"
      #   }, {
      #     "id" => "pancakeswap",
      #     "name" => "PancakeSwap (v2)"
      #   }, {
      #     "id" => "pancakeswap_others",
      #     "name" => "Pancakeswap (Others)"
      #   }, {
      #     "id" => "pancakeswap_v1",
      #     "name" => "PancakeSwap (v1)"
      #   }, {
      #     "id" => "pangolin",
      #     "name" => "Pangolin"
      #   }, {
      #     "id" => "paraswap",
      #     "name" => "Paraswap"
      #   }, {
      #     "id" => "paribu",
      #     "name" => "Paribu"
      #   }, {
      #     "id" => "paroexchange",
      #     "name" => "Paro Exchange"
      #   }, {
      #     "id" => "paymium",
      #     "name" => "Paymium"
      #   }, {
      #     "id" => "perpetual_protocol",
      #     "name" => "Perpetual Protocol"
      #   }, {
      #     "id" => "phemex",
      #     "name" => "Phemex"
      #   }, {
      #     "id" => "phemex_futures",
      #     "name" => "Phemex (Futures)"
      #   }, {
      #     "id" => "poloniex",
      #     "name" => "Poloniex"
      #   }, {
      #     "id" => "poloniex_futures",
      #     "name" => "Poloniex Futures"
      #   }, {
      #     "id" => "polyient_dex",
      #     "name" => "Polyient Dex"
      #   }, {
      #     "id" => "prime_xbt",
      #     "name" => "Prime XBT"
      #   }, {
      #     "id" => "probit",
      #     "name" => "ProBit"
      #   }, {
      #     "id" => "qtrade",
      #     "name" => "qTrade"
      #   }, {
      #     "id" => "quickswap",
      #     "name" => "Quickswap"
      #   }, {
      #     "id" => "quoine",
      #     "name" => "Liquid"
      #   }, {
      #     "id" => "radar_relay",
      #     "name" => "Radar Relay"
      #   }, {
      #     "id" => "raydium",
      #     "name" => "Raydium"
      #   }, {
      #     "id" => "resfinex",
      #     "name" => "Resfinex"
      #   }, {
      #     "id" => "rfinex",
      #     "name" => "Rfinex"
      #   }, {
      #     "id" => "safe_trade",
      #     "name" => "SafeTrade"
      #   }, {
      #     "id" => "sakeswap",
      #     "name" => "SakeSwap"
      #   }, {
      #     "id" => "sashimiswap",
      #     "name" => "Sashimiswap"
      #   }, {
      #     "id" => "satoexchange",
      #     "name" => "SatoExchange"
      #   }, {
      #     "id" => "saturn_network",
      #     "name" => "Saturn Network"
      #   }, {
      #     "id" => "secondbtc",
      #     "name" => "SecondBTC"
      #   }, {
      #     "id" => "secretswap",
      #     "name" => "SecretSwap"
      #   }, {
      #     "id" => "serum_dex",
      #     "name" => "Serum DEX"
      #   }, {
      #     "id" => "serumswap",
      #     "name" => "SerumSwap"
      #   }, {
      #     "id" => "shortex",
      #     "name" => "Shortex"
      #   }, {
      #     "id" => "simex",
      #     "name" => "Simex"
      #   }, {
      #     "id" => "sinegy",
      #     "name" => "SINEGY"
      #   }, {
      #     "id" => "sistemkoin",
      #     "name" => "Sistemkoin"
      #   }, {
      #     "id" => "six_x",
      #     "name" => "6x"
      #   }, {
      #     "id" => "south_xchange",
      #     "name" => "SouthXchange"
      #   }, {
      #     "id" => "spiritswap",
      #     "name" => "SpiritSwap"
      #   }, {
      #     "id" => "spookyswap",
      #     "name" => "Spookyswap"
      #   }, {
      #     "id" => "stake_cube",
      #     "name" => "StakeCube Exchange"
      #   }, {
      #     "id" => "stellar_term",
      #     "name" => "StellarTerm"
      #   }, {
      #     "id" => "stocks_exchange",
      #     "name" => "STEX"
      #   }, {
      #     "id" => "stormgain",
      #     "name" => "Stormgain"
      #   }, {
      #     "id" => "stormgain_futures",
      #     "name" => "Stormgain Futures"
      #   }, {
      #     "id" => "sushiswap",
      #     "name" => "Sushiswap"
      #   }, {
      #     "id" => "sushiswap_polygon",
      #     "name" => "Sushiswap (Polygon POS)"
      #   }, {
      #     "id" => "swapr",
      #     "name" => "Swapr"
      #   }, {
      #     "id" => "swiftex",
      #     "name" => "Swiftex"
      #   }, {
      #     "id" => "switcheo",
      #     "name" => "Switcheo"
      #   }, {
      #     "id" => "swop_fi",
      #     "name" => "Swop.Fi"
      #   }, {
      #     "id" => "synthetix",
      #     "name" => "Synthetix Exchange"
      #   }, {
      #     "id" => "tdax",
      #     "name" => "Satang Pro"
      #   }, {
      #     "id" => "therocktrading",
      #     "name" => "TheRockTrading"
      #   }, {
      #     "id" => "thodex",
      #     "name" => "Thodex"
      #   }, {
      #     "id" => "tidebit",
      #     "name" => "Tidebit"
      #   }, {
      #     "id" => "tidex",
      #     "name" => "Tidex"
      #   }, {
      #     "id" => "tokenize",
      #     "name" => "Tokenize"
      #   }, {
      #     "id" => "tokenlon",
      #     "name" => "Tokenlon"
      #   }, {
      #     "id" => "tokenomy",
      #     "name" => "Tokenomy"
      #   }, {
      #     "id" => "token_sets",
      #     "name" => "TokenSets"
      #   }, {
      #     "id" => "tokens_net",
      #     "name" => "TokensNet"
      #   }, {
      #     "id" => "toko_crypto",
      #     "name" => "TokoCrypto"
      #   }, {
      #     "id" => "tokok",
      #     "name" => "TOKOK"
      #   }, {
      #     "id" => "tokpie",
      #     "name" => "Tokpie"
      #   }, {
      #     "id" => "tomodex",
      #     "name" => "TomoDEX"
      #   }, {
      #     "id" => "topbtc",
      #     "name" => "TopBTC"
      #   }, {
      #     "id" => "trade_ogre",
      #     "name" => "TradeOgre"
      #   }, {
      #     "id" => "tron_trade",
      #     "name" => "TronTrade"
      #   }, {
      #     "id" => "trx_market",
      #     "name" => "PoloniDEX"
      #   }, {
      #     "id" => "txbit",
      #     "name" => "Txbit"
      #   }, {
      #     "id" => "ubeswap",
      #     "name" => "Ubeswap"
      #   }, {
      #     "id" => "unicly",
      #     "name" => "Unicly"
      #   }, {
      #     "id" => "uniswap",
      #     "name" => "Uniswap (v3)"
      #   }, {
      #     "id" => "uniswap_v1",
      #     "name" => "Uniswap (v1)"
      #   }, {
      #     "id" => "uniswap_v2",
      #     "name" => "Uniswap (v2)"
      #   }, {
      #     "id" => "unnamed",
      #     "name" => "Unnamed"
      #   }, {
      #     "id" => "upbit",
      #     "name" => "Upbit"
      #   }, {
      #     "id" => "upbit_indonesia",
      #     "name" => "Upbit Indonesia "
      #   }, {
      #     "id" => "value_liquid",
      #     "name" => "Value Liquid"
      #   }, {
      #     "id" => "value_liquid_bsc",
      #     "name" => "vSwap BSC"
      #   }, {
      #     "id" => "vb",
      #     "name" => "VB"
      #   }, {
      #     "id" => "vcc",
      #     "name" => "VCC Exchange"
      #   }, {
      #     "id" => "vebitcoin",
      #     "name" => "Vebitcoin"
      #   }, {
      #     "id" => "velic",
      #     "name" => "Velic"
      #   }, {
      #     "id" => "vindax",
      #     "name" => "Vindax"
      #   }, {
      #     "id" => "vinex",
      #     "name" => "Vinex"
      #   }, {
      #     "id" => "viperswap",
      #     "name" => "ViperSwap"
      #   }, {
      #     "id" => "virgox",
      #     "name" => "Virgox"
      #   }, {
      #     "id" => "vitex",
      #     "name" => "ViteX"
      #   }, {
      #     "id" => "wault_swap",
      #     "name" => "WaultSwap"
      #   }, {
      #     "id" => "waves",
      #     "name" => "Waves.Exchange"
      #   }, {
      #     "id" => "wazirx",
      #     "name" => "WazirX"
      #   }, {
      #     "id" => "whale_ex",
      #     "name" => "WhaleEx"
      #   }, {
      #     "id" => "whitebit",
      #     "name" => "WhiteBIT"
      #   }, {
      #     "id" => "xcoex",
      #     "name" => "XCOEX"
      #   }, {
      #     "id" => "xfutures",
      #     "name" => "xFutures"
      #   }, {
      #     "id" => "xt",
      #     "name" => "XT.COM"
      #   }, {
      #     "id" => "yobit",
      #     "name" => "YoBit"
      #   }, {
      #     "id" => "yunex",
      #     "name" => "Yunex.io"
      #   }, {
      #     "id" => "zaif",
      #     "name" => "Zaif"
      #   }, {
      #     "id" => "zb",
      #     "name" => "ZB"
      #   }, {
      #     "id" => "zbg",
      #     "name" => "ZBG"
      #   }, {
      #     "id" => "zbg_futures",
      #     "name" => "ZBG Futures"
      #   }, {
      #     "id" => "zbx",
      #     "name" => "ZBX"
      #   }, {
      #     "id" => "zebitex",
      #     "name" => "Zebitex"
      #   }, {
      #     "id" => "zebpay",
      #     "name" => "ZebPay"
      #   }, {
      #     "id" => "zero_ex",
      #     "name" => "0x Protocol"
      #   }, {
      #     "id" => "zero_exchange",
      #     "name" => "Zero Exchange"
      #   }, {
      #     "id" => "zg",
      #     "name" => "ZG.com"
      #   }, {
      #     "id" => "zgtop",
      #     "name" => "ZG.TOP"
      #   }, {
      #     "id" => "zilswap",
      #     "name" => "Zilswap"
      #   }, {
      #     "id" => "zipmex",
      #     "name" => "Zipmex"
      #   }, {
      #     "id" => "zkswap",
      #     "name" => "ZKSwap"
      #   }]
      def get_exchange_ids
        get 'exchanges/list'
      end

      # Fetches coin tickers from a specific exchange.
      #
      # @param id [String] the exchange id to fetch.
      # @option options [String] :coin_ids comma-separated list of tickers to fetch from the given exchange id (e.g. 'bitcoin, eth, litecoin').
      # @option options [String] :include_exchange_logo includes the exchange's logo.
      # @option options [Integer] :page sets the page for results.
      # @option options [String] :order ('trust_score_desc') sets the sort order for results. Valid values: trust_score_desc', 'trust_score_asc', 'volume_desc.
      # @option options [Boolean] :depth (false) displays orderbook depth (2%).
      #
      # @return [Hash] the exchange name and tickers as provided or all tickers if coin_ids is not provided.
      #
      # @example Get Bitcoin tickers from Binance.
      #   client.get_exchange_tickers(id: 'binance', options: { coin_ids: 'bitcoin' })
      # @example Response object
      #   {
      #     "name" => "Binance", "tickers" => [{
      #       "base" => "BTC",
      #       "target" => "USDT",
      #       "market" => {
      #         "name" => "Binance", "identifier" => "binance", "has_trading_incentive" => false
      #       },
      #       "last" => 48890.78,
      #       "volume" => 86837.96789156958,
      #       "converted_last" => {
      #         "btc" => 0.99871776, "eth" => 12.706618, "usd" => 48867
      #       },
      #       "converted_volume" => {
      #         "btc" => 86727, "eth" => 1103417, "usd" => 4243490314
      #       },
      #       "trust_score" => "green",
      #       "bid_ask_spread_percentage" => 0.01002,
      #       "timestamp" => "2021-05-16T07:37:00+00:00",
      #       "last_traded_at" => "2021-05-16T07:37:00+00:00",
      #       "last_fetch_at" => "2021-05-16T07:37:00+00:00",
      #       "is_anomaly" => false,
      #       "is_stale" => false,
      #       "trade_url" => "https://www.binance.com/en/trade/BTC_USDT?ref=37754157",
      #       "token_info_url" => nil,
      #       "coin_id" => "bitcoin",
      #       "target_coin_id" => "tether"
      #     }, {
      #       "base" => "BTC",
      #       "target" => "BUSD",
      #       "market" => {
      #         "name" => "Binance", "identifier" => "binance", "has_trading_incentive" => false
      #       },
      #       "last" => 48929.1,
      #       "volume" => 18176.952406055105,
      #       "converted_last" => {
      #         "btc" => 0.9991652, "eth" => 12.710228, "usd" => 48862
      #       },
      #       "converted_volume" => {
      #         "btc" => 18162, "eth" => 231033, "usd" => 888164944
      #       },
      #       "trust_score" => "green",
      #       "bid_ask_spread_percentage" => 0.01002,
      #       "timestamp" => "2021-05-16T07:43:46+00:00",
      #       "last_traded_at" => "2021-05-16T07:43:46+00:00",
      #       "last_fetch_at" => "2021-05-16T07:43:46+00:00",
      #       "is_anomaly" => false,
      #       "is_stale" => false,
      #       "trade_url" => "https://www.binance.com/en/trade/BTC_BUSD?ref=37754157",
      #       "token_info_url" => nil,
      #       "coin_id" => "bitcoin",
      #       "target_coin_id" => "binance-usd"
      #     }]
      #   }
      def get_exchange_tickers(id:, options: {})
        get "exchanges/#{id}/tickers", { options: options }
      end

      # Fetches news,announcments, and updates from a specific exchange.
      #
      # @param id [String] the exchange id to fetch.
      # @option options [Integer] :per_page (100) sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      #
      # @return [Hash] the status update data for the given exchange.
      #
      # @example Get the last 3 status updates from Binance.
      #   client.get_exchange_status_updates(id: 'binance', options: { per_page: 1 })
      # @example Response object
      #   {
      #     "status_updates" => [{
      #       "description" => "Juventus and Paris Saint-Germain Fan Tokens on Binance Launchpool! \r\n\r\nFarm JUV and PSG tokens By Staking BNB, BUSD & CHZ Tokens\r\n\r\nClick here➡️ https://ter.li/JUV-and-PSG-tokens",
      #       "category" => "general",
      #       "created_at" => "2020-12-14T11:18:49.085Z",
      #       "user" => "Darc",
      #       "user_title" => "Marketing",
      #       "pin" => false,
      #       "project" => {
      #         "type" => "Market", "id" => "binance", "name" => "Binance", "image" => {
      #           "thumb" => "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250", "small" => "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250", "large" => "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
      #         }
      #       }
      #     }]
      #   }
      def get_exchange_status_updates(id:, options: {})
        get "exchanges/#{id}/status_updates", { options: options }
      end

      # Fetches trade volume data from a specific exchange.
      #
      # @param id [String] the exchange id to fetch.
      # @param days [Integer] number of days ago to fetch trade volume data.
      #
      # @return [Array<Array<Float, String>>] the exchange's trade volume data in 10-minute intervals, hourly intervals, or daily intervals depending on the number of days given
      #
      # @example Get Binance's trade volume from a day ago.
      #   client.get_exchange_volume(id: 'binance', days: 1)
      # @example Response object (truncated)
      #   [
      #     [1620550200000.0, "1005476.2667217359131632087795432176371669876601688256288859094077173967202827700534809705802"], # [UNIX timestamp for exchange trade volume data, trade volume]
      #     [1620553800000.0, "1018442.2775982988468591292487708941265043962519659923872972786095536137127193126138169804088"],
      #     [1620557400000.0, "1042158.4333253484568599192332614201045319574863305612009609211497295171074087677404153278624"]
      #   ]
      def get_exchange_volume(id:, days:)
        get "exchanges/#{id}/volume_chart", { days: days }
      end
    end
  end
end
