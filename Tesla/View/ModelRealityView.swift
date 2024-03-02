//
//  ModelRealityView.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ModelRealityView: View {
    
    @State private var tesla: Entity?
    
    @Environment(ModelViewModel.self) private var model
    
    var body: some View {
        RealityView { content, attachments  in
            guard let entity = try? await Entity(named: "ModelScene", in: realityKitContentBundle) else {
                fatalError("加載 ModelScene 失敗")
            }
            
            entity.scale /= 10
            
            if let sceneAttachment = attachments.entity(for: "controlID") {
                sceneAttachment.position = [0, 0, 0]
                content.add(sceneAttachment)
            }
            
            content.add(entity)
            
            self.tesla = entity
            
        } attachments: {
            Attachment(id: "controlID") {
                ModelControls {
                    tesla?.setSunlight(intensity: model.lightIntensity)
                } turnOffLight: {
                    tesla?.setSunlight(intensity: 0)
                } turnOnRotate: {
                    tesla?.components.set(RotationComponent(speed: model.speed))
                } turnOffRotate: {
                    tesla?.components.set(RotationComponent(speed: 0))
                }
                .offset(y: 300)
            }
        }
    }
}

extension Entity {
    
    func setSunlight(intensity: Float?) {
        if let intensity {
            Task {
                guard let resource = try? await EnvironmentResource(named: "Sunlight") else { return }
                
                let iblComponent = ImageBasedLightComponent(
                    source: .single(resource),
                    intensityExponent: intensity
                )
                
                components.set(iblComponent)
                components.set(ImageBasedLightReceiverComponent(imageBasedLight: self))
            }
        } else {
            components.remove(ImageBasedLightComponent.self)
            components.remove(ImageBasedLightReceiverComponent.self)
        }
    }
    
}

#Preview {
    ModelRealityView()
        .environment(ModelViewModel())
}
