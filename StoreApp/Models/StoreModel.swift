//
//  StoreModel.swift
//  StoreApp
//
//  Created by Snehi Yavanam on 12/23/22.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    @Published var categories: [Category] = []
    @Published private(set) var products: [Product] = []
    
    let client = StoreHTTPClient()
    
    func fetchCategories() async throws {
        
        categories = try await client.load(Resource(url: URL.allCategories))
        
        //categories = try await client.getCategories(url: URL.allCategories)
    }
    
    func getProductsByCategory(_ categoryId: Int) async throws {
        
        products = try await client.load(Resource(url: .productsByCategory(categoryId)))
        
        //products = try await client.getProductsByCategory(url: .productsByCategory(categoryId))
    }
    
    func saveProduct(_ createProductRequest: CreateProductRequest) async throws {
        let data = try JSONEncoder().encode(createProductRequest)
        
        let product: Product = try await client.load(Resource(url: .saveProduct, method: .post(data)))
        products.append(product)
    }
    
}
