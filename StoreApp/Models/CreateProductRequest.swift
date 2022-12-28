//
//  CreateProductRequest.swift
//  StoreApp
//
//  Created by Snehi Yavanam on 12/28/22.
//

import Foundation

struct CreateProductRequest: Encodable {
    
    let title: String
    let price: Double
    let description: String
    let categoryId: Int
    let images: [URL]
    
}
