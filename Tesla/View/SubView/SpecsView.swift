//
//  SpecsView.swift
//  Tesla
//
//  Created by Terry Jason on 2024/3/1.
//

import SwiftUI

struct SpecsView: View {
    
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 30, alignment: .topLeading)
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            HStack(alignment: .top) {
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(SpecsViewData.allCases) { item in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(item.title)
                                .font(.system(size: 25, weight: .medium, design: .rounded))
                            Text(item.about)
                                .font(.system(size: 22, weight: .medium, design: .rounded))
                        }
                    }
                }
                
                Image("Vehicle")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 200, maxHeight: 100, alignment: .topTrailing)
            }
            .padding(60)
        }
    }
    
}

#Preview {
    SpecsView()
}
