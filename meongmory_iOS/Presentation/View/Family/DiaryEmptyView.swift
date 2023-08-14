//
//  DiaryEmptyView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct DiaryEmptyView: View {
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                Image("image")
                Text("오늘도 반려동물과 즐거운 시간을 보내셨나요?")
                    .font(Font.system(size: 15))
                    .fontWeight(.bold)
                    .frame(height: 20)
                Text("촬영했던 반려동물 사진과 함께 즐거웠던 시간을 기록해보세요!")
                    .font(Font.system(size: 13))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 62)
                    .frame(height: 40)
            }
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
        }
    }
}

struct DiaryEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryEmptyView()
    }
}
