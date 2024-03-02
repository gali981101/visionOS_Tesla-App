//
//  MainPageLinkData.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/1.
//

import Foundation

enum TeslaData: String, Identifiable, CaseIterable, Equatable {
    case specs, model, video
    
    var id: Self { self }
    var name: String { rawValue.capitalized }
    
    var title: String {
        switch self {
        case .specs:
            "Tesla Model Specs"
        case .model:
            "Tesla Model 3"
        case .video:
            "Tesla Model Video"
        }
    }
}
