//
//  ContentView.swift
//  SwiftDataCrud
//
//  Created by Dip on 29/7/25.
//

import SwiftUI

struct BookListView: View {
    @State private var showSheet: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
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
