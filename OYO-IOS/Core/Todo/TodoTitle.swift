//
//  TodoTitle.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 27/06/25.
//

import SwiftUI

struct TodoTitle: View {
    let item: TodoModel
    var body: some View {
        Text(item.title)
    }
}

#Preview {
    TodoTitle(item: TodoModel(title: "test"))
}
