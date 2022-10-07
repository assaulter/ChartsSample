//
//  ContentView.swift
//  ChartsSample
//
//  Created by Kazuki Kubo on 2022/10/06.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    private let weights: [ChartData.Weight] = ChartData.weights
    private let fats: [ChartData.Fat] = ChartData.fats
    private var average: Float {
        return weights
            .map{ $0.weight }
            .reduce(.zero, +) / Float(weights.count)
    }
    
    var body: some View {
        List {
            Section {
                // Weight Cart
                VStack(alignment: .leading) {
                    Text("Weight Chart")
                        .font(.largeTitle)
                        .foregroundStyle(.primary)
                    
                    Chart {
                        ForEach(weights) { val in
                            BarMark(
                                x: .value("Date", val.date),
                                yStart: .value("Weight", 50.0),
                                yEnd: .value("Weight", val.weight),
                                width: .ratio(0.3) // 0.0~1.0で幅の調整ができる。
                            )
                        }
                        // 縦 or 横に単一の線を引く
                        RuleMark(y: .value("Average", average))
                            .foregroundStyle(.orange)
                    }
                    .chartYAxis {
                        AxisMarks { value in
                            AxisGridLine() // 消したら横線が消える
                            AxisValueLabel {
                                if let val = value.as(Int.self) {
                                    Text("\(val)kg")
                                }
                            }
                        }
                    }
                    .chartYScale(domain: 50.0...57.0) // 描画範囲を指定
                    .frame(height: 140.0)
                }
            }
            Section {
                // Fat Chart
                VStack(alignment: .leading) {
                    Text("Fat Chart")
                        .font(.largeTitle)
                        .foregroundStyle(.primary)
                    Chart {
                        ForEach(fats) { val in
                            LineMark(
                                x: .value("Date", val.date),
                                y: .value("Fat", val.fat)
                            )
                        }
                        .symbol(by: .value("Type", "Fat"))
                        .interpolationMethod(.catmullRom)
                    }
                    .chartYAxis {
                        AxisMarks { value in
                            AxisGridLine() // 消したら横線が消える
                            AxisValueLabel {
                                if let val = value.as(Int.self) {
                                    Text("\(val)%")
                                }
                            }
                        }
                    }
                    .chartLegend(.hidden)
                    .chartYScale(domain: 15.0...25.0)
                    .frame(height: 140.0)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
