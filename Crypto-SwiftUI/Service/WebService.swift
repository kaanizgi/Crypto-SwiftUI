//
//  WebService.swift
//  Crypto-SwiftUI
//
//  Created by Kaan İzgi on 29.03.2022.
//

import Foundation


class WebService {
    
    func downloadCurrencies(url:URL) async throws -> [CryptoCurrency] {
        let (data,response) = try await URLSession.shared.data(from: url)
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        return currencies ?? []
    }
}
