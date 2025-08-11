//
//  SwiftDataCrudApp.swift
//  SwiftDataCrud
//
//  Created by Dip on 29/7/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataCrudApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for:Book.self)
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false)) // inspect and find save data
    }
}
