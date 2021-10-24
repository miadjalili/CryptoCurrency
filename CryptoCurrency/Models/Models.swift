//
//  Models.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/23/21.
//

import Foundation

struct Element: Codable {
    let coins: [Coin]
}

// MARK: - Coin
struct Coin: Codable {
    let id: String
    let icon: String
    let name, symbol: String
    let rank: Int
    let price, priceBtc, volume, marketCap: Double
    let availableSupply, totalSupply, priceChange1H, priceChange1D: Double
    let priceChange1W: Double
    let websiteURL: String
    let twitterURL: String
    let exp: [String]
    let contractAddress: String?
    let decimals: Int?

    enum CodingKeys: String, CodingKey {
        case id, icon, name, symbol, rank, price, priceBtc, volume, marketCap, availableSupply, totalSupply
        case priceChange1H
        case priceChange1D
        case priceChange1W
        case websiteURL
        case twitterURL
        case exp, contractAddress, decimals
    }
}
