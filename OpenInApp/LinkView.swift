//
//  LinkView.swift
//  OpenInApp
//
//  Created by Sarthak Agrawal on 29/05/24.
//

import Foundation
import SwiftUI
struct LinksView: View {
    @ObservedObject var viewModel = ViewModel()
    var linkType: LinkType
    
    enum LinkType {
        case top
        case recent
    }
    
    var body: some View {
        List {
            ForEach(linkType == .top ? viewModel.topLinks : viewModel.recentLinks) { link in
                VStack(alignment: .leading) {
                    Text(link.title)
                        .font(.headline)
                    Text(link.smart_link)
                        .font(.subheadline)
                    Text("\(link.total_clicks) Clicks")
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle(linkType == .top ? "Top Links" : "Recent Links")
    }
}
