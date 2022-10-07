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
    private var yStart: Float {
        return 50.0 // ほんとは計算した値を返す
    }
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("Charts Sample")
                    .font(.largeTitle)
                    .foregroundStyle(.primary)
                
                Chart {
                    // 棒グラフ
                    ForEach(weights) { val in
//                        BarMark(
//                            x: .value("Date", val.date),
//                            y: .value("Weight", val.weight),
//                            width: .ratio(0.3) // 0.0~1.0でいい感じに表示される
//                        )
                        BarMark(
                            x: .value("Date", val.date),
                            yStart: .value("Weight", yStart),
                            yEnd: .value("Weight", val.weight),
                            width: .ratio(0.3) // 0.0~1.0でいい感じに表示される
                        )
                    }
//                    ForEach(fats) { val in
//                        LineMark(
//                            x: .value("Date", val.date),
//                            y: .value("Fat", val.fat)
//                        )
//                    }
                    // 縦 or 横に単一の線を引く
                    RuleMark(y: .value("Average", average))
                        .foregroundStyle(.orange)
                        .annotation(position: .top, alignment: .leading) {
                            Text("Average: \(String(format: "%.1f", average))kg")
                                .font(.headline)
                                .foregroundColor(.orange)
                        }
                }
//                .chartYScale(range: .plotDimension(startPadding: 20.0, endPadding: 0.0)) // start: 下部, end: 上部のパディング
                .chartYScale(domain: yStart...58.0)
                .frame(height: 240.0)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
