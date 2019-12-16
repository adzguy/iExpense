//
//  ContentView.swift
//  iExpense
//
//  Created by Davron on 12/16/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bill"
    @Published var lastName = "Clinton"
}
struct ContentView: View {
    
    @ObservedObject var user = User()
    
    var body: some View {
        
        VStack {
            Text("His name is \(user.firstName) \(user.lastName)")
            TextField("First", text: $user.firstName)
            TextField("Last", text: $user.lastName)
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
