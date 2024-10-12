//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = ""
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        fetchCoin(currency)
    }
    
    func fetchCoin(_ currency: String){
            let urlString = "\(baseURL)\(currency)?apikey=\(apiKey)"
            performRequest(with: urlString)
        }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    func performRequest(with urlString : String){
            if let url = URL(string: urlString){
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                    if error != nil {
                        self.delegate?.didFailWithError(error: error!)
                        return
                    }
                    if let safeData = data {
                        if let coin = parseJSON(safeData) {
                            
                            delegate?.didUpdateCoin(self ,coin: coin)
                        }
                        
                    }
                }
                task.resume()
            }
        }
    func parseJSON(_ coinData: Data) -> CoinModel? {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(CoinData.self, from: coinData)
                let base = decodedData.asset_id_base
                let quote = decodedData.asset_id_quote
                let rate = decodedData.rate
                let coin = CoinModel(assetIdBase: base, assetIdQuote: quote, rate: rate)
                return  coin
            } catch {
                self.delegate?.didFailWithError(error: error)
            }
            return nil
        }
}
