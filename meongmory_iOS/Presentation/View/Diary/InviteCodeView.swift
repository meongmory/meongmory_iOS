//
//  InviteCodeView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/08.
//

import SwiftUI

struct InviteCodeView: View {
    @State var inviteCode: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("가족 및 지인으로 등록하기")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 20))
                    
                    Image("diary_add_invite")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 23, height: 23)
                        .clipped()
                    
                    Spacer()
                }
                
                Text("가족 및 지인에게서 멍모리에서 보낸 초대 코드를 입력해주세요!\n유효한 초대코드를 입력하면 강아지의 일상을 같이 볼 수 있어요!")
                  .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                  .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                  .padding(.top, 12)
            } // 제목 + 소개
            .padding(.top, 69)
            .padding(.leading, 16)
            
            
            VStack(alignment: .leading) {
                HStack(spacing: 12) {
                    TextField("초대 코드 입력", text: $inviteCode)
                        .frame(width: 227, height: 39)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                    
                    Button {
                        // TODO: 초대코드 확인 로직 연결
                    } label: {
                        Text("확인")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.99, blue: 0.99))
                    }
                    .foregroundColor(.clear)
                    .frame(width: 104, height: 39)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(10)
                    
                    Spacer()
                } // 초대코드 입력창 + 버튼 HStack 끝
                
                // TODO: if문을 통해 로직 시 숨김 처리
                Text("유효한 코드가 아닙니다.")
                  .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                  .foregroundColor(Color(red: 0.8, green: 0.37, blue: 0.36))
                  .padding(.top, 10)
            } // 초대코드 입력창 + 확인 버튼 + 알림 VStack 끝
            .padding(.top, 84)
            .padding(.leading, 16)
            
            Spacer()
           

            NavigationLink {
                // TODO: 다이어리 생성 View
            } label: {
                Text("다음")
                    .font(Font.custom("AppleSDGothicNeoSB00", size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 1, green: 0.99, blue: 0.99))
            }
            .frame(width: 343, height: 45)
            // 색상 변경 삼항연상자 쓰기
            .background(Color(red: 0.99, green: 0.61, blue: 0.07))
            .cornerRadius(10)
            
        } // 전체 View
    }
}

struct InviteCodeView_Previews: PreviewProvider {
    static var previews: some View {
        InviteCodeView()
    }
}
