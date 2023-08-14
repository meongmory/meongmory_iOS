//
//  PetListView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct PetListView: View {
    @State var isSelected: [Bool] = [false, false, false, false]
    let rows = [GridItem(.fixed(70), spacing: 15)]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<4, id: \.self) { cell in
                        VStack(spacing: 5) {
                            ZStack {
                                PetLazyHGridCell()
                                    .onTapGesture {
                                        if isSelected[cell] {
                                            isSelected[cell] = false
                                        } else {
                                            for i in 0..<4 {
                                                if i == cell {
                                                    isSelected[i] = true
                                                } else {
                                                    isSelected[i] = false
                                                }
                                            }
                                        }
                                    }
                                if isSelected[cell] {
                                    Image("yellow_check_circle_fill")
                                }
                            }
                            
                            VStack(spacing: -5) {
                                Text("밍키")
                                    .font(Font.system(size: 12))
                                    .fontWeight(.medium)
                                    .frame(height: 20)
                                Text("10살")
                                    .font(Font.system(size: 10))
                                    .frame(height: 20)
                            }
                        }
                    }
                    // 펫 추가 버튼도 지인들은 안 보임.
                    PetAddButton()
                        .frame(height: 110, alignment: .top)
                }
                .padding(.trailing, 16)
            }
            .frame(height: 110, alignment: .leading)
            .padding(.top, 10)
            .padding(.leading, 16)
            .padding(.bottom, 5)
            
            Divider()
        }
        .frame(height: 125)
    }
}

struct PetListView_Previews: PreviewProvider {
    static var previews: some View {
        PetListView()
    }
}
