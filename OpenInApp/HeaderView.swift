//
//  HeaderView.swift
//  OpenInApp
//
//  Created by Sarthak Agrawal on 30/05/24.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Dashboard")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "gear")
                .font(.title)
        }
    }
}
