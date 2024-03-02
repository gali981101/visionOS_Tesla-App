//
//  MainPage.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/1.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20, content: {
                Text("Welcome To Tesla")
                    .padding(.top, 250)
                    .font(.system(size: 42, weight: .medium))
                
                Text("Design your tesla or get a trade-in estimate for your current vehicle.")
                    .font(.system(size: 34, weight: .medium))
                
                HStack(spacing: 100, content: {
                    ForEach(TeslaData.allCases) { data in
                        NavigationLink {
                            if data == TeslaData.specs {
                                SpecsView()
                                    .navigationTitle(data.title)
                            } else if data == TeslaData.model {
                                ModelView()
                                    .navigationTitle(data.title)
                            } else if data == TeslaData.video {
                                VideoView()
                                    .navigationTitle(data.title)
                            }
                        } label: {
                            Label(data.name, systemImage: "")
                                .font(.system(size: 35, weight: .medium, design: .rounded))
                        }
                        .controlSize(.extraLarge)
                        .hoverEffect(.automatic)
                    }
                })
                .padding(.top, 20)
            })
            .background(alignment: .center) {
                Image("HeroImage")
            }
        }
    }
}

#Preview {
    MainPage()
}
