//
//  ChartView.swift
//  OpenInApp
//
//  Created by Sarthak Agrawal on 29/05/24.
//
import SwiftUI
import Charts

struct ChartView: View {
    let data: [String: Int]
    let sampleData = ["1" : 23 , "2": 2]

    var body: some View {
        let sortedData = getSortedData(data)
        
        ZStack {
            Chart {
                ForEach(sortedData, id: \.0) { hour, clicks in
                    LineMark(
                        x: .value("Hour", hour),
                        y: .value("Clicks", clicks)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(Color.blue)
                    
                    // Shadow effect
                    AreaMark(
                        x: .value("Hour", hour),
                        yStart: .value("Clicks", clicks),
                        yEnd: .value("Clicks", 0)
                    )
                    .foregroundStyle(LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                }
            }
            .frame(height: 150)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: 2))
                
            }
            .chartYAxisLabel("Clicks")
            .chartXAxisLabel("Hours")
        }
        
    }
    
    private func getSortedData(_ data: [String:Int]) -> [(Int, Int)]{
        let sortedData = data.map { (key, value) -> (Int, Int) in
            let hour = Int(key.prefix(2)) ?? 0
            return (hour, value)
        }.sorted { $0.0 < $1.0 }
        
        return sortedData
    }
}

//#Preview {
//    ChartView(data: ["1" : 1])
//}

