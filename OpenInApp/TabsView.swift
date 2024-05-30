//
//  TabsView.swift
//  OpenInApp
//
//  Created by Sarthak Agrawal on 30/05/24.
//

import SwiftUI

struct TabsView: View {
    let recentLinks: [Link]
    let topLinks: [Link]
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedTab) {
                Text("Top Links").tag(0)
                Text("Recent Links").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedTab == 0 {
                LinksListView(links: topLinks)
            } else {
                LinksListView(links: recentLinks)
            }
        }
    }
}

struct LinksListView: View {
    let links: [Link]
    
    var body: some View {
        List(links) { link in
            LinkRowView(link: link)
        }
    }
}
struct LinkRowView: View {
    let link: Link

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(link.title)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(link.web_link)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(link.total_clicks) Clicks")
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}


#Preview {
    TabsView(recentLinks: [], topLinks: [])
}
