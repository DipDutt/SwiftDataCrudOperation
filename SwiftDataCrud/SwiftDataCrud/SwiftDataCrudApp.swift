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
    let container:ModelContainer
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(container)
    }
    
    init() {
        let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "MyBooks.store"))
        do {
            container = try ModelContainer(for:Book.self, configurations:config)
        } catch  {
            fatalError("Error loading SwiftData: \(error.localizedDescription)")
        }
        print(URL.documentsDirectory.path())
    }
}
