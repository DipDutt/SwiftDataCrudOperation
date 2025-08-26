//
//  BookList.swift
//  SwiftDataCrud
//
//  Created by Dip on 26/8/25.
//

import SwiftUI
import SwiftData

struct BookList: View {
    @Query(sort:\Book.title) var books:[Book]
    @Environment(\.modelContext) private var context
    var body: some View {
        Group {
            if books.isEmpty {
                ContentUnavailableView("To add Your Book tap ➕ ", systemImage: "book.fill")
            }
            
            else {
                List {
                    ForEach(books) { book in
                        NavigationLink {
                            EditView(book: book)
                        } label: {
                            HStack(spacing: 5) {
                                book.iconImage
                                VStack(alignment: .leading) {
                                    Text(book.title).font(.title2)
                                    Text(book.author).foregroundStyle(.secondary)
                                }
                            }
                        }
                        
                    }
                    // MARK: - add onDelete modifier.
                    .onDelete { indexSet in
                        indexSet.forEach { indexValue in
                            let book = books[indexValue]
                            context.delete(book)
                        }
                    }
                }
                .listStyle(.plain)
                
            }
        }
    }
}

#Preview {
    let preview = Preview()
    preview.addExamples(Book.sampleBooks)
    return NavigationStack{ BookList()
    }
    .modelContainer(preview.container)
}
