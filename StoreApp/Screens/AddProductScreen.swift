//
//  AddProductScreen.swift
//  StoreApp
//
//  Created by Snehi Yavanam on 12/27/22.
//

import SwiftUI

struct AddProductScreen: View {
    
    @State private var title: String = ""
    @State private var price: Double = 0.0
    @State private var description: String = ""
    @State private var selectedCategory: Category?
    @State private var imageUrl: String = ""
    @State private var errorMessage = ""
    @EnvironmentObject var storeModel: StoreModel
    @Environment(\.dismiss) var dismissAction
    private var isDoneDisabled: Bool {
        title.isEmpty || price.isZero || description.isEmpty || selectedCategory == nil || imageUrl.isEmpty
    }
    
    private func saveProduct() {
        guard let category = selectedCategory,let imageUrl = URL(string: imageUrl) else {
            return
        }
        
        let createProductRequest = CreateProductRequest(title: title, price: price, description: description, categoryId: category.id, images: [imageUrl])
        
        Task {
            do {
                try await storeModel.saveProduct(createProductRequest)
                dismissAction()
            } catch {
                errorMessage = "Error Saving the Product."
            }
        }
        
        //storeModel.saveProduct(createProductRequest)
    }
    
    
    var body: some View {
        Form {
            TextField("Enter title", text: $title)
            TextField("Enter price", value: $price, format: .number)
            TextField("Enter description", text: $description)
            
            Picker("Categories", selection: $selectedCategory) {
                ForEach(storeModel.categories, id: \.id) { category in
                    Text(category.name)
                }
            }
            .pickerStyle(.wheel)
            
            TextField("Image URL", text: $imageUrl)
        }
        .navigationTitle("Add Product")
        .onAppear {
            selectedCategory = storeModel.categories.first
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismissAction()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    saveProduct()
                }
                .disabled(isDoneDisabled)
            }
        }
        
    }
}

struct AddProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        let storeModel = StoreModel()
        storeModel.categories = [
        Category(id: 1, name: "Clothes", image: URL(string: "https://placeimg.com/640/480/any?r=0.9300320592588625")!),
        Category(id: 2, name: "Electronics", image: URL(string: "https://placeimg.com/640/480/any?r=0.9178516507833767")!),
        Category(id: 3, name: "Furniture", image: URL(string: "https://placeimg.com/640/480/any")!)
        ]
        return
        NavigationStack {
            AddProductScreen().environmentObject(storeModel)
        }
    }
}
