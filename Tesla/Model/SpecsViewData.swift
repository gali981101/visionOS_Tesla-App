//
//  SpecsViewData.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/2.
//

import Foundation

enum SpecsViewData: String, Identifiable, CaseIterable, Equatable {
    case weight, cargo, wheels, seating, displays, groundClearance, overallWidth, overallHeight, overallLength
    
    var id: Self { self }
    
    var name: String { rawValue.capitalized }
    
    var title: String {
        switch self {
        case .weight:
            "Weight"
        case .cargo:
            "Cargo"
        case .wheels:
            "Wheels"
        case .seating:
            "Seating"
        case .displays:
            "Displays"
        case .groundClearance:
            "Ground Clearance"
        case .overallWidth:
            "Overall Width"
        case .overallHeight:
            "Overall Height"
        case .overallLength:
            "Overall Length"
        }
    }
    
    var about: String {
        switch self {
        case .weight:
            "1,765 kg"
        case .cargo:
            "682 litres"
        case .wheels:
            "18 \" or 19 \""
        case .seating:
            "5 Adults"
        case .displays:
            """
            "15.4 \" Center
            Touchscreen
            8 \" Rear Touchscreen"
            """
        case .groundClearance:
            "138 mm"
        case .overallWidth:
            """
            Folded mirrors: 1.933
            mm
            Extended mirrors:
            2,089 mm
            """
        case .overallHeight:
            "1,441 mm"
        case .overallLength:
            "4,720 mm"
        }
    }
}


