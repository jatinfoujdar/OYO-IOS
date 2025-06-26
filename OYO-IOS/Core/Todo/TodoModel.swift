//
//  TodoModel.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 27/06/25.
//

import Foundation

struct TodoModel: Identifiable{
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
