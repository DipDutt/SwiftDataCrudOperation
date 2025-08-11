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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NewBookView()
}
