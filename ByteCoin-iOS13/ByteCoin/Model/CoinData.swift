//
//  CoinData.swift
//  ByteCoin
//
//  Created by Дмирий Зядик on 12.10.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
