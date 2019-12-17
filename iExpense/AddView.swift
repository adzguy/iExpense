//
//  AddView.swift
//  iExpense
//
//  Created by Davron on 12/17/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentaionMode
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showingAlert = false
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(self.types, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                    
                }
                .navigationBarTitle("Add new item")
                .navigationBarItems(trailing:
                    Button("Save") {
                        self.addItem()
                        if self.showingAlert {
                            self.addItem()
                        }
                        else{
                            self.presentaionMode.wrappedValue.dismiss()
                        }
                        
                    }
                )
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Amount Incorrect"), message: Text("Please enter a number to the amount!"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    func addItem() {
        if let actualAmount = Int(self.amount) {
            let expense = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
            expenses.items.append(expense)
            showingAlert = false
        }
        else {
            
            showingAlert = true
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
