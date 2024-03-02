//
//  ImmersiveView.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            guard let resource = try? await TextureResource(named: "lake_scene") else {
                fatalError("加載全景湖面圖片失敗")
            }
            
            var material = UnlitMaterial()
            material.color = .init(texture: .init(resource))
            
            let entity = Entity()
            
            entity.components.set(ModelComponent(
                mesh: .generateSphere(radius: 1000),
                materials: [material]
            ))
            
            entity.scale *= .init(x: -1, y: 1, z: 1)
            
            content.add(entity)
        }
    }
}

