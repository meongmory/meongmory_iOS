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
                    .font(Font.system(size: 14, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 80)
                    .lineLimit(2)
            }
            
            Text("루비, 밍키")
                .font(Font.system(size: 12))
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 100, height: 20)
              .lineLimit(1)
        }
    }
}

struct FamilyLazyHGridCell_Previews: PreviewProvider {
    static var previews: some View {
        FamilyLazyHGridCell()
    }
}
