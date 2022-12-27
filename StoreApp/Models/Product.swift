//
//  Product.swift
//  StoreApp
//
//  Created by Snehi Yavanam on 12/24/22.
//

import Foundation

struct Product: Codable {
    var id: Int?
    let title: String
    let price: Double
    let description: String
    let category: Category
    let images: [URL]?
}
