//
//  EditView.swift
//  SwiftDataCrud
//
//  Created by Dip on 12/8/25.
//

import SwiftUI

struct EditView: View {
     // MARK: - Properties
    @State private var status = Status.onShelf
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var rating: Int?
    @State private var summary: String = ""
    @State private var dateAdded: Date = Date.distantPast
    @State private var dateStarted: Date = Date.distantPast
    @State private var dateCompleted: Date = Date.distantPast
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    EditView()
}
