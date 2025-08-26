//
//  Book.swift
//  SwiftDataCrud
//
//  Created by Dip on 4/8/25.
//

import SwiftUI
import SwiftData

// MARK: -  Create Book model class
@Model
final class Book {
    
    // MARK: - Properties
    var title: String
    var author: String
    var dateAdded: Date
    var dateStarted: Date
    var dateCompleted: Date
    var summary: String
    var rating: Int?
    var status:Status.RawValue
    // MARK: - init method
    init(
        title: String,
        author: String,
        dateAdded: Date = Date.now,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        summary:String = "",
        rating: Int? = nil,
        status:Status = .onShelf
    ) {
        self.title = title
        self.author = author
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.summary = summary
        self.rating = rating
        self.status = status.rawValue
    }
    
    var iconImage: Image {
        switch Status(rawValue: status) {
        case .onShelf:
            return Image(systemName: "checkmark.diamond.fill")
        case .inProgress:
            return Image(systemName: "books.vertical")
        case .completed:
            return Image(systemName: "books.vertical.fill")
        case .none:
            return Image(systemName: "books")
        }
    }
}

// MARK: -  Create enum for status.
enum Status:Int,Codable,CaseIterable,Identifiable {
    case onShelf,inProgress,completed
   // MARK: -  Create id for each case .
    var id:Self {
        self
    }
    // MARK: - create computed property for show description.
    var description:String {
        switch self {
        case .onShelf:
            return "On Shelf"
        case .inProgress:
            return "In Progress"
        case .completed:
            return "Completed"
        }
    }
    
}
