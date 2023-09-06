//
//  MapTypeLazyGrid.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/07.
//

import SwiftUI

struct MapTypeLazyGrid: View {
    let columns: [GridItem] = [GridItem(.flexible(), spacing: 5, alignment: nil)]
    @State var selected: [Bool] = [false, false, false, false]
    
    var body: some View {
        HStack {
            LazyHGrid(rows: columns, alignment: .top) {
                ForEach(0..<MapKind.allCases.count, id: \.self) { item in
                    ZStack {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: MapKind.allCases[item].getWidth(), height: 30)
                        .background(selected[item] ? MapKind.allCases[item].getColor() : .white.opacity(0.8))
                        .cornerRadius(15)
                        
                        HStack(alignment: .center, spacing: 4) {
                            Label {
                                Text(MapKind.allCases[item].rawValue)
                                    .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                                    .foregroundColor(selected[item] ? .white : .black)
                            } icon: {
                                Image(selected[item] ? MapKind.allCases[item].getSelectedImage() : MapKind.allCases[item].getImage())
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
