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
            ContentView()
        }
        .modelContainer(for:Book.self)
    }
}
