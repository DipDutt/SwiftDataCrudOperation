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
    @State private var bookTitle: String = ""
    @State private var authorName: String = ""
    @State private var rating: Int?
    @State private var summary: String = ""
    @State private var dateAdded: Date = Date.distantPast
    @State private var dateStarted: Date = Date.distantPast
    @State private var dateCompleted: Date = Date.distantPast
    @Environment(\.dismiss) var dismiss
    let book: Book
    var body: some View {
        HStack {
            Text("Status Type")
            Picker("Show Status", selection: $status) {
                ForEach(Status.allCases) { status in
                    Text(status.description).tag(status)
                }
            }
            .buttonStyle(.bordered)
        }
        VStack(alignment: .leading) {
            GroupBox {
                LabeledContent {
                    DatePicker("", selection: $dateAdded, displayedComponents: .date)
                } label: {
                    Text("Date Added")
                }
                
                if status == .inProgress || status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateStarted, displayedComponents: .date)
                    } label: {
                        Text("Date Started")
                    }
                }
                if status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateCompleted, displayedComponents: .date)
                    } label: {
                        Text("Date Completed")
                    }
                }
            }
            .onChange(of: status){ oldValue, newValue in
                if newValue == .onShelf {
                    dateAdded = Date.distantPast // book end
                    dateStarted = Date.distantPast
                    
                }
                else if newValue == .inProgress && oldValue == .completed {
                    dateStarted = Date.distantPast // book started to end
                }
                
                else if newValue == .inProgress && oldValue == .onShelf {
                    dateStarted = Date.now // book started
                }
                
                else if newValue == .completed  && oldValue == .onShelf{
                    dateCompleted = Date.now // forget the book
                }
                else {
                    dateCompleted = Date.now
                }
            }
            .foregroundStyle(.secondary)
            
            Divider()
            
            LabeledContent {
                TextField("enter bookTitle", text: $bookTitle)
            } label: {
                Text("BookTitle")
            }
            
            LabeledContent {
                TextField("enter author name", text: $authorName)
            } label: {
                Text("Author Name")
            }
            Divider()
            Text("Summary")
            TextEditor(text: $summary)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle(bookTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          
                Button("Update") {
                    book.status = status.rawValue
                    book.title = bookTitle
                    book.author = authorName
                    book.summary = summary
                    book.dateStarted = dateStarted
                    book.dateCompleted = dateCompleted
                    book.dateAdded = dateAdded
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
        }
        
        .onAppear {
            dateStarted = book.dateStarted
            dateCompleted = book.dateCompleted
            dateAdded = book.dateAdded
            authorName = book.author
            bookTitle = book.title
            summary = book.summary
            status = Status(rawValue: book.status)!
        }
        
    }
    
}
#Preview {
    let preview = Preview()
    return NavigationStack {
        EditView(book:Book.sampleBooks[2])
    }
}
