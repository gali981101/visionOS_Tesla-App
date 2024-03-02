//
//  ModelViewModel.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/2.
//

import Foundation
import Observation

@Observable class ModelViewModel {
    var isShowingCarModel: Bool = false
    var isShowLight: Bool = false
    var isRotating: Bool = false
    
    var lightIntensity: Float = 11
    var speed: Float = 0.1
}
