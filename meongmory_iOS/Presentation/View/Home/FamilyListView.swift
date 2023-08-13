//
//  FamilyListView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/13.
//

import SwiftUI

struct FamilyListView: View {
    var body: some View {
        let rows = [GridItem(.fixed(100), spacing: 12)]
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 20) {
                Text("강아지네")
                    .font(Font.custom("AppleSDGothicNeoB00", size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.24, green: 0.16, blue: 0.04))
                    .padding(.top, 11)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(0..<10, id: \.self) { cell in
                            FamilyLazyHGridCell()
                        }
                    }
                    .padding(.trailing, 16)
                }
                .frame(maxHeight: 125, alignment: .leading)
            }
            .padding(.leading, 16)
            .padding(.bottom, 13)
            Divider()
        }
    }
}

struct FamilyListView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyListView()
    }
}
