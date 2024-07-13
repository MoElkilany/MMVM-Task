//
//  VerticalIconWithTitle.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import SwiftUI

struct VerticalIconWithTitle: View {
    let iconName: String
    let value: String
    
    var body: some View {
        VStack{
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 35 , height: 35)
                .foregroundColor(.black)
            Text(value)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .lineLimit(3)
        }
    }
}
