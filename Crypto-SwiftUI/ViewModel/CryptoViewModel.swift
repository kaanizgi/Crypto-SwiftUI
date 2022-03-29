//
//  CryptoViewModel.swift
//  Crypto-SwiftUI
//
//  Created by Kaan İzgi on 29.03.2022.
//

import Foundation

class CryptoListVieModel:ObservableObject {
    
    
    @Published var cryptoList = [CryptoCurrency]()
    
    let webservice = WebService()
    
    let baseUrl:URL = URL(string: "https://json.kaanizgi.com/crypto.json")!
    
    func downloadCryptos() async {
        do {
            let cryptos = try await webservice.downloadCurrencies(url: baseUrl)
            DispatchQueue.main.async {
                self.cryptoList = cryptos
            }
        } catch {
            print(error)
        }
    }
}
