//
//  DiaryListView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/19.
//

import SwiftUI

struct DiaryListView: View {
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .padding(.top, 1)
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(0..<10, id: \.self) { idx in
                        DiaryListViewRow(petList: ["루비", "밍키", "옥수수"], date: "2023년 8월 21일", numOfMedia: 5)
                    }
                }
            }
        }
    }
}

struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView()
    }
}
