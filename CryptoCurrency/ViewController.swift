//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/22/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchData()
        self.getExchanges()
        self.getMarket()
        self.getTicker()
    }

    
    func fetchData(currency:String = "EUR"){
        APIClient.GetCoins(currency: currency) { result in
            switch result {
            case .success(let Coins):
                print("1")
                print(Coins.coins[0].name)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getExchanges(){
        APIClient.GetExchanges { result in
            switch result{
            case .success(let Exchanges):
                print("2")
                print(Exchanges.supportedExchanges)
            case .failure(let error):
            print(error)
            }
            
            
        }
    }

    func getMarket(coinId:String = "bitcoin"){
        APIClient.GetMarket(coinID: coinId) { result in
            switch result{
            case .success(let Market):
                print("3")
                print(Market[0].exchange)
            case .failure(let error):
            print(error)
            }
        }
    }
    func getTicker(exchange:String = "Binance",pair:String = "BTC-USD"){
        APIClient.GetTickers(exchange: exchange, pair: pair) { result in
            switch result{
            case .success(let Ticker):
                print("4")
            print(Ticker.tickers)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}

