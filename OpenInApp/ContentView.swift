//
//  ContentView.swift
//  OpenInApp
//
//  Created by Sarthak Agrawal on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                Divider()
                GreetingView()
                Divider()
                Text("Hour/Clicks Overview")
                    .font(.title2)
                ChartView(data: viewModel.apiResponse.data.overall_url_chart)
                AnalyticsView(todayClicks: viewModel.apiResponse.today_clicks, topLocation: viewModel.apiResponse.top_location, topSource: viewModel.apiResponse.top_source)
                TabsView(recentLinks: viewModel.recentLinks, topLinks: viewModel.topLinks)
                
            }
            .padding()
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
