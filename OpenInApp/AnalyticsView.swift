//
//  AnalyticsView.swift
//  OpenInApp
//
//  Created by Sarthak Agrawal on 30/05/24.
//

import SwiftUI

struct AnalyticsView: View {
    let todayClicks: Int
    let topLocation: String
    let topSource: String

    var body: some View {
        HStack {
            AnalyticsItemView(title: "Today's Clicks", value: "\(todayClicks)")
            AnalyticsItemView(title: "Top Location", value: topLocation)
            AnalyticsItemView(title: "Top Source", value: topSource)
        }
    }
}

struct AnalyticsItemView: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    AnalyticsView(todayClicks: 0, topLocation: "Meerut", topSource: "Fb")
}
