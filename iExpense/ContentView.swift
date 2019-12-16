//
//  ContentView.swift
//  iExpense
//
//  Created by Davron on 12/16/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

class User {
    var firstName = "Bill"
    var lastName = "Clinton"
}
struct ContentView: View {
    
    @State private var user = User()
    
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
