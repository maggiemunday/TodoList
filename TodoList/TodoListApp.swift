//
//  TodoListApp.swift
//  TodoList
//
//  Created by Maggie Munday on 8/1/22.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var itemListViewModel: ItemListViewModel = ItemListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ItemListView()
            }
            .environmentObject(itemListViewModel)
        }
    }
}
