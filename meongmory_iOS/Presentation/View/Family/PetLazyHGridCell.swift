//
//  PetLazyHGridCell.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct PetLazyHGridCell: View {
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 5) {
            Circle()
                .foregroundColor(.clear)
                .frame(width: 70, height: 70)
                .background(isSelected ? Image("yellow_check_circle_fill") : nil)
                .background(
                    Image("pet_example")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 68, height: 68)
                        .overlay(
                            Circle()
                                .stroke(Color(red: 1, green: 0.76, blue: 0.24), lineWidth: 2)
                        )
                )
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .clipShape(Circle())
                .onTapGesture {
                    // 여기 @State 변수랑 리스트뷰에서 쓰는 거 총 2개 사용
                    isSelected = !isSelected
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
        .frame(height: 110, alignment: .top)
    }
}

struct PetLazyHGridCell_Previews: PreviewProvider {
    static var previews: some View {
        PetLazyHGridCell()
    }
}
