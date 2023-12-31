//
//  BusinessView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct BusinessView: View {
    var body: some View {
        VStack {
            Text("(주) 뉴모리 ㅣ 대표:  차유상")
                .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.7, green: 0.72, blue: 0.74))
            
            VStack(spacing: 0) {
                Text("사업자 등록번호: 000-00-00000")
                Text("통신판매업 신고 번호: 제0000호 - 00 - 0000호")
                Text("인천광역시 남동구 서창남순환로 82 104-1301")
            }
            .font(Font.custom("AppleSDGothicNeoM00", size: 11))
            .foregroundColor(Color(red: 0.7, green: 0.72, blue: 0.74))
            .multilineTextAlignment(.center)
            .padding(.vertical, 6)
            
            HStack {
                Button("서비스 이용약관") {
                    // TODO: 서비스 이용약관으로 이동
                }
                
                Text("ㅣ")
                
                Button("개인정보처리방침") {
                    // TODO: 개인정보처리방침으로 이동
                }
            }
            .font(Font.custom("AppleSDGothicNeoSB00", size: 11))
            .foregroundColor(Color(red: 0.7, green: 0.72, blue: 0.74))
        }
        .padding(.bottom, 26)
    }
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
    }
}
