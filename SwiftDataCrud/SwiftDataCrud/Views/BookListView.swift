//
//  ContentView.swift
//  SwiftDataCrud
//
//  Created by Dip on 29/7/25.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @State private var showSheet: Bool = false
    @Query(sort:\Book.title) var books:[Book]
    @Environment(\.modelContext) private var context
    var body: some View {
        NavigationStack {
            Group {
                if books.isEmpty {
                    ContentUnavailableView("Enter Your Book TO PRESS ➕ BUTTON IN THE TOP RIGHT CORNER ", systemImage: "book.fill")
                }
                
                else {
                    List {
                        ForEach(books) { book in
                            NavigationLink {
                                Text(book.title)
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
                .toolbar {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
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
    BookListView()
        .modelContainer(for: Book.self,inMemory: true)
}
