//
//  QuoteListView.swift
//  SwiftDataCrud
//
//  Created by Dip on 3/11/25.
//

import SwiftUI

struct QuoteListView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) var context
    let book:Book
    @State private var text: String = ""
    @State private var page: String = ""
    @State private var selectedQuote:Quote?
    
     // MARK: - computed property
    var isEditing: Bool {
        selectedQuote != nil
    }
    
   // MARK: - Body
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

 // MARK: - Preview
#Preview {
    let preview = Preview()
    preview.addExamples(Book.sampleBooks)
        return QuoteListView(book:Book.sampleBooks[4])
    .modelContainer(preview.container)
    
}
