//
//  AddDiaryView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/08.
//

import SwiftUI

struct AddDiaryView: View {
    @State var diaryName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("펫다이어리 만들기")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 20))
                            .foregroundColor(Color(red: 0.99, green: 0.61, blue: 0.07))
                        
                        Image("diary_add_invite")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 23, height: 23)
                            .clipped()
                        
                        Spacer()
                    }
                    
                    Text("우리 집만의 개성 있는 펫다이어리 이름을 정해보세요!")
                      .font(Font.custom("AppleSDGothicNeoSB00", size: 16))
                      .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                      .padding(.top, 9)
                } // 제목 + 소개
                .padding(.top, 69)
                .padding(.leading, 16)
                
                
                VStack() {
                    HStack {
                        Text("강아지네")
                            .font(Font.custom("Noto Sans KR", size: 12).weight(.medium))
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                        Spacer()
                    }.padding(.leading, 16)
                   
                    
                    TextField("초대 코드 입력", text: $diaryName)
                        .frame(height: 39)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                  
                    // TODO: if문을 통해 로직 시 숨김 처리
                    HStack {
                        Text("최대 한글 6자, 영문 12자까지 입력 가능해요.")
                            .font(Font.custom("AppleSDGothicNeoM00", size: 11))
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                            .padding(.top, 6)
                        
                        Spacer()
                    }
                    .padding(.leading, 16)
                } // 초대코드 입력창 + 확인 버튼 + 알림 VStack 끝
                .padding(.top, 84)
                
                Spacer()
               

                NavigationLink {
                    // TODO: 강아지 등록 페이지
                } label: {
                    Text("만들기")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1, green: 0.99, blue: 0.99))
                }
                .frame(width: 343, height: 45)
                // 색상 변경 삼항연상자 쓰기
                .background(Color(red: 0.99, green: 0.61, blue: 0.07))
                .cornerRadius(10)
                
            } // 전체 View
        } // 네비게이션 View 끝
    }
}

struct AddDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        AddDiaryView()
    }
}
