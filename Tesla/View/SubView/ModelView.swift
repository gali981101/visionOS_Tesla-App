//
//  ModelView.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/1.
//

import SwiftUI

struct ModelView: View {

    @Environment(ModelViewModel.self) private var model
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        @Bindable var model = model
        
        VStack(spacing: nil) {
            Image("model-3-tesla")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 900)
            Toggle(model.isShowingCarModel ? "Hide Model 3" : "Show Model 3", isOn: $model.isShowingCarModel)
                .onChange(of: model.isShowingCarModel, initial: false, { oldValue, newValue in
                    Task {
                        if newValue {
                            openWindow(id: "ModelRealityView")
                        } else {
                            dismissWindow(id: "ModelRealityView")
                        }
                    }
                })
                .toggleStyle(.button)
                .controlSize(.extraLarge)
                .font(.title)
                .padding(.bottom, 50)
        }
    }
}

#Preview {
    ModelView()
        .environment(ModelViewModel())
}
