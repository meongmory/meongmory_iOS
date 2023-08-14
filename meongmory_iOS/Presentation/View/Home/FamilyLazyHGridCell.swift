//
//  FamilyLazyHGridCell.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct FamilyLazyHGridCell: View {
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 100, height: 100)
                    .background(
                        Image("pet_example")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 98, height: 98)
                            .overlay(
                                Circle()
                                    .stroke(Color(red: 0.99, green: 0.61, blue: 0.07), lineWidth: 2)
                                    .background(.black.opacity(0.2))
                            )
                    )
                    .clipShape(Circle())
                
                Text("유상이네")
                    .font(Font.custom("AppleSDGothicNeoB00", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            
            // 너무 길어지면 말줄임표 사용
            Text("루비, 밍키")
              .font(Font.custom("AppleSDGothicNeoM00", size: 12))
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
        }
    }
}

struct FamilyLazyHGridCell_Previews: PreviewProvider {
    static var previews: some View {
        FamilyLazyHGridCell()
    }
}
