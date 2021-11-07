//
//  CurrencyViewModel.swift
//  Converto-SwiftUI
//
//  Created by Burhan Kaynak on 09/06/2021.
//

import Foundation

struct CurrencyModel: Codable {
    var currencies = ["AUD","BRL","CAD","CNY","CUP","EUR","GBP","HKD","ILS","INR","JPY","KPW","KRW","MXN","NGN","NZD","RUB","SGD","TRY","UAH","USD","VND"]
    
    func fetchData(for selectedCurrency: String, completion: @escaping (DataModel) -> ()) {
        let urlString = "http://data.fixer.io/api/latest?access_key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            print("Unable to create the URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let safeData = data {
                    let currencies = try! JSONDecoder().decode(CurrencyData.self, from: safeData)
                    if let decodedRate = currencies.rates[selectedCurrency] {
                        let result = DataModel(rate: decodedRate, currency: selectedCurrency)
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    }
                }
            }
        }.resume()
    }
}
