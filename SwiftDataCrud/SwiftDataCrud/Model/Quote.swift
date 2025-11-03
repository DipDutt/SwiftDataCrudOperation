//
//  Quote.swift
//  SwiftDataCrud
//
//  Created by Dip on 3/11/25.
//

import Foundation
import SwiftData

@Model
final class Quote {
    var creationDate: Date = Date.now
    var text: String
    var page:String?
    
    init(text: String, page: String? = nil) {
        self.text = text
        self.page = page
    }
    var book:Book?
    
}
