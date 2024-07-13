//
//  VerticalTitleWithDescription.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import SwiftUI

struct VerticalTitleWithDescription: View {
    let title: String
    let description: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .lineLimit(3)
            Text(description)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}
