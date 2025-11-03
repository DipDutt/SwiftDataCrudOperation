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
        GroupBox {
            HStack(spacing: 20) {
                LabeledContent("Page") {
                    TextField("page #", text:$page)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 150)
                        Spacer()
                }
                if isEditing {
                    Button("Cancel") {
                        page = ""
                        text = ""
                        selectedQuote = nil
                    }
                    .buttonStyle(.bordered)
                   
                }
                Button(isEditing ? "Update":"Create") {
                    if isEditing {
                        selectedQuote?.page = page.isEmpty ? nil : page
                        selectedQuote?.text = text
                        text = ""
                        page = ""
                        selectedQuote = nil
                    }
                    
                    else {
                        let quote = page.isEmpty ? Quote(text: text) : Quote(text:text, page:page)
                        book.quotes?.append(quote)
                        text = ""
                        page = ""
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(text.isEmpty)
            }
            TextEditor(text: $text)
                .border(Color.gray,width: 3)
                .frame(height: 100)
        }
        .padding(.horizontal, 10)
    }
}

 // MARK: - Preview
#Preview {
    let preview = Preview()
    preview.addExamples(Book.sampleBooks)
        return QuoteListView(book:Book.sampleBooks[4])
    .modelContainer(preview.container)
    
}
