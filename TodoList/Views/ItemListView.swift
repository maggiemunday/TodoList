//
//  ItemListView.swift
//  TodoList
//
//  Created by Maggie Munday on 8/1/22.
//

import SwiftUI

struct ItemListView: View {
    
    @EnvironmentObject var itemListViewModel: ItemListViewModel
    
    var body: some View {
        List {
            ForEach(itemListViewModel.items) { item in
                ItemListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            itemListViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: itemListViewModel.deleteItem)
            .onMove(perform: itemListViewModel.moveItem)
        }
        .navigationTitle("My ToDos ✏️")
        .navigationBarItems(
            leading: EditButton(),
            trailing:NavigationLink("+", destination: AddView())
        )
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemListView()
        }
        .environmentObject(ItemListViewModel())
    }
}
