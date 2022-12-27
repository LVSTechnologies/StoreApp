//
//  Locale+Extension.swift
//  StoreApp
//
//  Created by Snehi Yavanam on 12/25/22.
//

import Foundation

extension Locale {
    static var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
}
