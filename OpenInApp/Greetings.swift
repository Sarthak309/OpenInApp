//
//  Greetings.swift
//  OpenInApp
//
//  Created by Sarthak Agrawal on 29/05/24.
//

import SwiftUI

struct GreetingView: View {
    var body: some View {
        Text(getGreeting())
            .font(.title)
            .padding()
    }
    
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        default:
            return "Good Evening"
        }
    }
}
