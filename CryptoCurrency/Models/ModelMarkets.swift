//
//  ModelMarkets.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/25/21.
//

import Foundation
struct ElementMarket: Codable {
    let price: Double
    let exchange, pair: String
    let pairPrice, volume: Double
    let link: String?
}
typealias GetMarkrt = [ElementMarket]
