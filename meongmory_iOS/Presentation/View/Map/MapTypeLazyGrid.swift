//
//  MapTypeLazyGrid.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/07.
//

import SwiftUI

struct MapTypeLazyGrid: View {
    let columns: [GridItem] = [GridItem(.flexible(), spacing: 5, alignment: nil)]
    let title: [String] = ["애견카페", "미용실", "식료품점", "병원"]
    let image: [String] = ["map_cafe", "map_hair", "map_food", "map_hospital"]
    let selectedImage: [String] = ["map_cafe_white", "map_hair_white", "map_food_white", "map_hospital_white"]
    let width: [CGFloat] = [90, 79, 90, 69]
    let color: [Color] = [Color(red: 0.38, green: 0.45, blue: 0.95), Color(red: 0.99, green: 0.69, blue: 0.13), Color(red: 0.98, green: 0.44, blue: 0.4), Color(red: 0.18, green: 0.56, blue: 0.98)]
    @State var selected: [Bool] = [false, false, false, false]
    
    var body: some View {
        HStack {
            LazyHGrid(rows: columns, alignment: .top) {
                ForEach(0..<4, id: \.self) { item in
                    ZStack {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: width[item], height: 30)
                        .background(selected[item] ? color[item] : .white.opacity(0.8))
                        .cornerRadius(15)
                        
                        HStack(alignment: .center, spacing: 4) {
                            Label {
                                Text(title[item])
                                    .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                                    .foregroundColor(selected[item] ? .white : .black)
                            } icon: {
                                Image(selected[item] ? selectedImage[item] : image[item])
                                    .frame(width: 15, height: 15)
                            }
                        }
                    }.onTapGesture {
                        if selected[item] {
                            selected[item] = false
                        }else {
                            for i in 0..<4 {
                                if i == item {
                                    selected[i] = true
                                }else {
                                    selected[i] = false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MapTypeLazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        MapTypeLazyGrid()
    }
}
