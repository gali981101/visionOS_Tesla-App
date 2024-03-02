//
//  RotatinSystem.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/2.
//

import RealityKit

struct RotationComponent: Component {
    var speed: Float
    var axis: SIMD3<Float>
    
    init(speed: Float = 1.0, axis: SIMD3<Float> = [0, 1, 0]) {
        self.speed = speed
        self.axis = axis
    }
}

struct RotatinSystem: System {
    init(scene: Scene) {}
    
    static let query = EntityQuery(where: .has(RotationComponent.self))
    
    func update(context: SceneUpdateContext) {
        for entity in context.entities(matching: Self.query, updatingSystemWhen: .rendering) {
            
            guard let component: RotationComponent = entity.components[RotationComponent.self] else { continue }
            
            entity.setOrientation(.init(angle: component.speed * Float(context.deltaTime), axis: component.axis), relativeTo: entity)
        }
    }
}

