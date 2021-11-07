//
//  CurrencyData.swift
//  Converto-SwiftUI
//
//  Created by Burhan Kaynak on 09/06/2021.
//

import Foundation

struct CurrencyData: Codable {
    var rates: [String: Double]
    var success: Bool
    var base: String
}
