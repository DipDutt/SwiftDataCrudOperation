//
//  ContentView.swift
//  SwiftDataCrud
//
//  Created by Dip on 29/7/25.
//

import SwiftUI

struct BookListView: View {
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
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.orange)
                        .imageScale(.large)
                }

                    
            }
            
        }
       
    }
}

#Preview {
    BookListView()
}
