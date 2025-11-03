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
            HStack {
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
            }
        }
    }
}

 // MARK: - Preview
#Preview {
    let preview = Preview()
    preview.addExamples(Book.sampleBooks)
        return QuoteListView(book:Book.sampleBooks[4])
    .modelContainer(preview.container)
    
}
