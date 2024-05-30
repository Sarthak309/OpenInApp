//
//  ViewModel.swift
//  OpenInApp
//
//  Created by Sarthak Agrawal on 29/05/24.
//

import SwiftUI
import Combine


class ViewModel: ObservableObject {
    @Published var recentLinks: [Link] = []
    @Published var topLinks: [Link] = []
    @Published var chartData: [Double] = []
    @Published var errorMessage: String?
    @Published var apiResponse: APIResponse = APIResponse(status: false, statusCode: 0, message: "HI", support_whatsapp_number: "HI", extra_income: 0.0, total_links: 0, total_clicks: 123, today_clicks: 0, top_source: "Facebook", top_location: "Meerut", startTime: "HI", links_created_today: 0, applied_campaign: 0, data: DataClass(recent_links: [], top_links: [], favourite_links: [], overall_url_chart: ["" : 0]))

    private var cancellables = Set<AnyCancellable>()

    func fetchData() {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else { return }
        var request = URLRequest(url: url)
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { response in
                self.apiResponse = response
                self.recentLinks = response.data.recent_links
                self.topLinks = response.data.top_links
//                self.chartData = response.data.overall_url_chart ?? ["" : 0]
            })
            .store(in: &cancellables)
    }
}

