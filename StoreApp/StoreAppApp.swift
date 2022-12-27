//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Snehi Yavanam on 12/23/22.
//

import SwiftUI

@main
struct StoreAppApp: App {
    @StateObject private var storeModel = StoreModel()
    var body: some Scene {
        WindowGroup {
            CategoryListScreen().environmentObject(storeModel)
        }
    }
}
