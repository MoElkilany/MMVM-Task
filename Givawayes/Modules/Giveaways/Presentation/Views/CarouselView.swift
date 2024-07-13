//
//  CarouselView.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import SwiftUI


struct CarouselView<Content: View>: View {
    var items: [Giveaway]
    var content: (Giveaway) -> Content
    
    init(items: [Giveaway], @ViewBuilder content: @escaping (Giveaway) -> Content) {
        self.items = items
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width * 0.4
            let spacing = (geometry.size.width - itemWidth) / 2
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    ForEach(items) { item in
                        GeometryReader { itemGeometry in
                            let minX = itemGeometry.frame(in: .global).minX
                            let rotationAngle = Double(minX - spacing) / -5
                            content(item)
                                .frame(width: itemWidth, height: geometry.size.height)
                                .rotation3DEffect(
                                    .degrees(rotationAngle),
                                    axis: (x: -1, y: 1, z: 0),
                                    perspective: 1)
                        }
                        .frame(width: itemWidth, height: geometry.size.height)
                    }
                }
                .padding(.horizontal, spacing )
            }
        }
    }
}


struct CarouselRow: View {
    let giveaway: Giveaway
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string:giveaway.image ?? ""))
                .frame(width: 300 , height: 200)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text (giveaway.title ?? "")
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(3)
                Spacer()
                Text( giveaway.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(3)
            }
            .padding()
            .frame(width: 300 , height: 200)
            .background(Color.black.opacity(0.6))
            .cornerRadius(20)
        }

    }
}
