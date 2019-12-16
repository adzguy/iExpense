//
//  ContentView.swift
//  iExpense
//
//  Created by Davron on 12/16/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View {
        Button("Hello \(name), Tap to Dismiss!"){
            self.presentationMode.wrappedValue.dismiss()
        }

    }
}
struct ContentView: View {
    
    @State private var isShowing = false
    
    var body: some View {
        Button("Main view") {
            self.isShowing.toggle()
        }
        .sheet(isPresented: $isShowing) {
            SecondView(name: "Bill")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
