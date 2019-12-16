//
//  ContentView.swift
//  iExpense
//
//  Created by Davron on 12/16/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName : String
}

struct ContentView: View {
    
    @State private var user = User(firstName: "Bill", lastName: "Gates")
    
    var body: some View {
        Button("Save User") {
           let encoder = JSONEncoder()
            if let data = try? encoder.encode(self.user){
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
