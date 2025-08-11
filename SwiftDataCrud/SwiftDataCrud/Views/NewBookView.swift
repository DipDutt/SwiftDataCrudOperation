//
//  NewBookView.swift
//  SwiftDataCrud
//
//  Created by Dip on 11/8/25.
//

import SwiftUI

struct NewBookView: View {
     // MARK: -  Properties
    @Environment(\.dismiss) private var dismiss
    @State private var bookTitle: String = ""
    @State private var authorName: String = ""
    @Environment(\.modelContext) private var context
    var body: some View {
        NavigationStack {
            Form {
                TextField("BookTitle", text:$bookTitle)
                TextField("AuthorName", text:$authorName)
                Button("Create") {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .disabled(bookTitle.isEmpty || authorName.isEmpty)
                .navigationTitle("NewBook")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    NewBookView()
}
