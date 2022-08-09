//
//  AddView.swift
//  TodoList
//
//  Created by Maggie Munday on 8/1/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var itemListViewModel: ItemListViewModel
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            let backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            VStack {
                TextField("I need to...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(backgroundColor))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save" .uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
            
        }
        .navigationTitle("Add a Todo ✏️")
    }
    
    func saveButtonPressed() {
        itemListViewModel.addItem(description: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ItemListViewModel())
    }
}
