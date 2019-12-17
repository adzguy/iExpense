//
//  ContentView.swift
//  iExpense
//
//  Created by Davron on 12/16/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text("\(item.name) \(item.type)")
               }
            .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action: {
                    self.addExpense()
                })
                {
                    Image(systemName: "plus")
                }
            )
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func addExpense() {
        let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
        expenses.items.append(expense)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
