//
//  PetLazyHGridCell.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct PetLazyHGridCell: View {
    var body: some View {
        Circle()
            .foregroundColor(.clear)
            .frame(width: 70, height: 70)
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
    }
}

struct PetLazyHGridCell_Previews: PreviewProvider {
    static var previews: some View {
        PetLazyHGridCell()
    }
}
