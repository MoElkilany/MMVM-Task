//
//  ChoosePlateformView.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import SwiftUI


struct ChoosePlateform :  View {
    @State private var selectedOption: String = "all"
    let onSelectPlateform: ((String)->Void)?
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Platforms.allCases, id: \.self) { option in
                    Text(option.rawValue)
                        .font(.headline)
                        .padding(10)
                        .foregroundColor(self.selectedOption  == option.rawValue ? Color.black : Color.gray)
                        .onTapGesture {
                            self.selectedOption = option.rawValue
                            onSelectPlateform?(option.filteredName)
                        }
                }
            }
            .padding()
        }
    }
}
