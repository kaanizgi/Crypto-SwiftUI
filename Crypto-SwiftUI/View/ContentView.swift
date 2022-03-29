//
//  ContentView.swift
//  Crypto-SwiftUI
//
//  Created by Kaan İzgi on 29.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var ViewModel  = CryptoListVieModel()
    
    var body: some View {
        NavigationView {
            List(ViewModel.cryptoList) { crypto in
                VStack(alignment: .leading, spacing: 10) {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.black)
                    Text(crypto.price)
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }.task {
                await ViewModel.downloadCryptos()
            }
            .navigationTitle("Crypto")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
