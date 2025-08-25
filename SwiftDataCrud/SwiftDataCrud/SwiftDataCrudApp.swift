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
        // 1. Define the schema of models that this app will persist.
        let schema = Schema([Book.self])
        let config = ModelConfiguration("MyBooks",schema:schema)
        do {
            container = try ModelContainer(for:schema, configurations:config)
        } catch  {
            fatalError("Error loading SwiftData: \(error.localizedDescription)")
        }
        print(URL.applicationDirectory.path(percentEncoded: true))
    }
}
