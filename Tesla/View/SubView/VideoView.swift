//
//  VideoView.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/1.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    @State private var player: AVPlayer = AVPlayer(url: Bundle.main.url(forResource: "JOTARO VS DIO 4K 60 FPS", withExtension: "mp4")!)
    
    @Environment(\.openImmersiveSpace) private var openImmersive
    @Environment(\.dismissImmersiveSpace) private var dismissImmersive
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .onAppear(perform: {
                    player.play()
                    
                    Task {
                        await openImmersive(id: "FullBG")
                    }
                })
                .onDisappear {
                    player.pause()
                    
                    Task {
                        await dismissImmersive()
                    }
                }
        }
    }
}

#Preview {
    VideoView()
}

