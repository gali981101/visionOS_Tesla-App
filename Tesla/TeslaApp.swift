//
//  TeslaApp.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/1.
//

import SwiftUI

@main
struct TeslaApp: App {
    @State private var model: ModelViewModel = ModelViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainPage()
                .environment(model)
        }
        
        WindowGroup(id: "ModelRealityView") {
            ModelRealityView()
                .environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 2, height: 0.5, depth: 1, in: .meters)
        
        ImmersiveSpace(id: "FullBG") {
            ImmersiveView()
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
    
    init() {
        RotationComponent.registerComponent()
        RotatinSystem.registerSystem()
    }
}
