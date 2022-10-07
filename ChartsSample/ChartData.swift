//
//  ChartData.swift
//  ChartsSample
//
//  Created by Kazuki Kubo on 2022/10/06.
//

import Foundation

struct ChartData {
    
    // MARK: - ToyShape
    
    struct ToyShape: Identifiable {
        var color: String
        var type: String
        var count: Double
        var id = UUID()
    }
    
    static let stackedToyShape: [ToyShape] = [
        .init(color: "Green", type: "Cube", count: 2),
        .init(color: "Green", type: "Sphere", count: 0),
        .init(color: "Green", type: "Pyramid", count: 1),
        .init(color: "Purple", type: "Cube", count: 1),
        .init(color: "Purple", type: "Sphere", count: 1),
        .init(color: "Purple", type: "Pyramid", count: 1),
        .init(color: "Pink", type: "Cube", count: 1),
        .init(color: "Pink", type: "Sphere", count: 2),
        .init(color: "Pink", type: "Pyramid", count: 0),
        .init(color: "Yellow", type: "Cube", count: 1),
        .init(color: "Yellow", type: "Sphere", count: 1),
        .init(color: "Yellow", type: "Pyramid", count: 2)
    ]
    
    // MARK: - Weight
    
    struct Weight: Identifiable {
        let id = UUID()
        let weight = Float.random(in: 51...57)
        var date: String
    }
    
    static let dates: [String] = [
        "8/13", "8/14", "8/15", "8/16", "8/17", "8/18", "8/19"
    ]
    
    static var weights: [Weight] {
        return dates.map { .init(date: $0) }
    }
    
    // MARK: - fat
    
    struct Fat: Identifiable {
        let id = UUID()
        let fat = Float.random(in: 15...25)
        var date: String
    }
    
    static var fats: [Fat] {
        return dates.map { .init(date: $0) }
    }
}
