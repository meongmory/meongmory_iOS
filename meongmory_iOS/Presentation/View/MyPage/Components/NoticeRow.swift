//
//  NoticeRow.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/10.
//

import SwiftUI

struct NoticeRow: View {
    var body: some View {
        VStack {
            HStack {
                Text("공지사항 제목입니다")
                    .font(Font.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 10)
                Spacer()
                Text("2023년 8월 10일")
                    .font(Font.system(size: 13))
                    .foregroundColor(.black)
            }
            Divider()
        }
        .background(NavigationLink("", destination: NoticeDetailView()).opacity(0))
    }
}

struct NoticeRow_Previews: PreviewProvider {
    static var previews: some View {
        NoticeRow()
    }
}
