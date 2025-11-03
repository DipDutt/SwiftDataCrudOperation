//
//  QuoteListView.swift
//  SwiftDataCrud
//
//  Created by Dip on 3/11/25.
//

import SwiftUI

struct QuoteListView: View {
    @Environment(\.managedObjectContext) var context
    let book:Book
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let preview = Preview()
    let books = Book.sampleBooks
    preview.addExamples(Book.sampleBooks)
        return QuoteListView(book:Book.sampleBooks[4])
    .modelContainer(preview.container)
    
}
