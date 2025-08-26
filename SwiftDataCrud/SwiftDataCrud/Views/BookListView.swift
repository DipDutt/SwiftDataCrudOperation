//
//  ContentView.swift
//  SwiftDataCrud
//
//  Created by Dip on 29/7/25.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    // MARK: -  Propeties
    @State private var showSheet: Bool = false
    @Query(sort:\Book.title) var books:[Book]
    @Environment(\.modelContext) private var context
    var body: some View {
        NavigationStack {
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
            .navigationTitle("BookList")
            // MARK: - add toolbar
            .toolbar {
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundStyle(.orange)
                        .imageScale(.large)
                }
                
                
            }
            
            // MARK: - present the sheet.
            .sheet(isPresented: $showSheet) {
                NewBookView()
                    .presentationDetents([.medium,.large])
            }
            
        }
        
    }
}

#Preview {
    let preview = Preview()
    preview.addExamples(Book.sampleBooks)
    return BookListView()
        .modelContainer(preview.container)
}
