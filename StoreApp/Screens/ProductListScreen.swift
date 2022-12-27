//
//  ProductListScreen.swift
//  StoreApp
//
//  Created by Snehi Yavanam on 12/25/22.
//

import SwiftUI

struct ProductListScreen: View {
    @EnvironmentObject var storeModel: StoreModel
    let category: Category
    var body: some View {
        List(storeModel.products, id: \.id) { product in
            ProductCellView(product: product)
        }
        .listStyle(.plain)
        .navigationTitle(category.name)
        .task {
            do {
                try await storeModel.getProductsByCategory(category.id)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductListScreen(category: Category(id: 1, name: "Clothes", image: URL(string: "https://placeimg.com/640/480/any?r=0.9178516507833767")!))
                .environmentObject(StoreModel())
        }
    }
}
