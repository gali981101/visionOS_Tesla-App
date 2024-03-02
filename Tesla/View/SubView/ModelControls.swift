//
//  ModelControls.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/2.
//

import SwiftUI

struct ModelControls: View {
    
    @Environment(ModelViewModel.self) private var model
    
    let turnOnLight: () -> Void
    let turnOffLight: () -> Void
    
    let turnOnRotate: () -> Void
    let turnOffRotate: () -> Void
    
    var body: some View {
        @Bindable var model: ModelViewModel = model
        
        VStack {
            HStack(spacing: nil) {
                Toggle(isOn: $model.isShowLight) {
                    Label("Light", systemImage: "sun.max")
                }
                .onChange(of: model.isShowLight, initial: false) { oldValue, newValue in
                    if newValue {
                        turnOnLight()
                    } else {
                        turnOffLight()
                    }
                }
                
                Toggle(isOn: $model.isRotating) {
                    Label("Rotate", systemImage: "arrow.triangle.2.circlepath")
                }
                .onChange(of: model.isRotating, initial: false) { oldValue, newValue in
                    if newValue {
                        turnOnRotate()
                    } else {
                        turnOffRotate()
                    }
                }
            }
        }
        .toggleStyle(.button)
        .controlSize(.extraLarge)
        .buttonStyle(.borderless)
        .labelStyle(.iconOnly)
        .glassBackgroundEffect(in: .rect(cornerRadius: 50))
    }
}


