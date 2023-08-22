//
//  DiaryGalleryView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/19.
//

import SwiftUI

struct DiaryGalleryView: View {
    private let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItems, spacing: 2) {
                ForEach(0..<25, id: \.self) { index in
                    Rectangle()
                        .foregroundColor(.clear)
                        .aspectRatio(contentMode: .fit)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                }
            }
            .padding(.top, 2)
            .padding(.horizontal, 16)
            .padding(.bottom, 40)
        }
    }
}

struct DiaryGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryGalleryView()
    }
}
