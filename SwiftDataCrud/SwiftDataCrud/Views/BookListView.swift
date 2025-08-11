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
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        Text(book.title)
                    } label: {
                       
                    }

                }
            }
            .listStyle(.plain)
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
}
