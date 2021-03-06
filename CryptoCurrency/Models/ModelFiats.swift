//
//  ModelFiats.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/24/21.
//

import Foundation

struct ElementFiats: Codable {
    let name: String
    let rate: Double
    let symbol: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case name, rate, symbol
        case imageURL
    }
}


