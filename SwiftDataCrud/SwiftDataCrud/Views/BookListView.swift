//
//  ContentView.swift
//  SwiftDataCrud
//
//  Created by Dip on 29/7/25.
//

import SwiftUI
import SwiftData


enum Sortoder:String, Identifiable,CaseIterable{
    case title
    case author
    case status
    var id: Self {
        self
    }
}

struct BookListView: View {
    // MARK: -  Propeties
    @State private var showSheet: Bool = false
    @State private var sortOrder:Sortoder = .title
   
    var body: some View {
        NavigationStack {
            Picker("Sort By", selection: $sortOrder) {
                ForEach(Sortoder.allCases) { sortOrder in
                    Text("sort by :\(sortOrder.rawValue)").tag(sortOrder)
                }
            }
            .buttonStyle(.bordered)
            BookList()
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
