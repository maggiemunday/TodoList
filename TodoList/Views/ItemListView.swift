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
            if(itemListViewModel.items.isEmpty) {
                Text("Click the '+' to add a todo!")
                    .foregroundColor(Color.gray)
            }
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
        .navigationTitle("My ToDos")
        .navigationBarItems(
            leading: EditButton(),
            trailing:NavigationLink("+", destination: AddView())
                .font(.title2)
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
