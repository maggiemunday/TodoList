//
//  ItemListRowView.swift
//  TodoList
//
//  Created by Maggie Munday on 8/1/22.
//

import SwiftUI

struct ItemListRowView: View {
    
    let item: Item
    
    var body: some View {
        HStack {
            Text(item.description)
            Spacer()
            Image(systemName: item.isDone ? "checkmark.square": "square")
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ItemListRowView_Previews: PreviewProvider {
    
    static var exampleItem1 = Item(description: "item 1", isDone: false)
    static var exampleItem2 = Item(description: "item 2", isDone: true)
    
    static var previews: some View {
        Group {
            ItemListRowView(item: exampleItem1)
            ItemListRowView(item: exampleItem2)
        }
        .previewLayout(.sizeThatFits)
    }
}
