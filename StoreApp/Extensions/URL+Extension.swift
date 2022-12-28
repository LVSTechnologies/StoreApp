//
//  URL+Extension.swift
//  StoreApp
//
//  Created by Snehi Yavanam on 12/23/22.
//

import Foundation

extension URL {
    
    static var development: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var production: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var baseURL: URL {
        #if DEBUG
            return development
        #else
            return production
        #endif
    }
    
    static var allCategories: URL {
        URL(string: "/api/v1/categories", relativeTo: Self.baseURL)!
    }
    
    static var saveProduct: URL {
        URL(string: "/api/v1/products", relativeTo: Self.baseURL)!
    }
    
    static func productsByCategory(_ categoryId: Int) -> URL {
        return URL(string: "/api/v1/categories/\(categoryId)/products", relativeTo: Self.baseURL)!
    }
    
}
