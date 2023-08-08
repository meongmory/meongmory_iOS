//
//  AddDiaryView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/08.
//

import SwiftUI

struct AddDiaryView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("환영합니다")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 20))
                            .foregroundColor(Color(red: 0.99, green: 0.61, blue: 0.07))
                        
                        // TODO: 이름 State 사용하여 변경
                        Text("차유상님!")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 20))
                        
                        
                        Image("diary_add_con")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 23, height: 23)
                            .clipped()
                    } // 환영인사 + 이모티콘 Hstack 끝
                    
                    
                    
                    VStack {
                        Text("우리집 강아지를 등록하고 가족, 지인과 반려동물의 추억을 공유해보세요!")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 14))
                            .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                            .frame(width: 343, alignment: .topLeading)
                            
                        Text("혹은 가족 및 지인에게 초대 코드를 받아 강아지들의 일상을 구경해보세요!")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 14))
                            .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                            .frame(width: 343, alignment: .topLeading)
                            .padding(.top, 8)
                    } // 소개글 VStack 끝
                    .padding(.top, 15)
                } // 환영글 VStack
                .padding(.leading, 16)
                .padding(.top, 65)
                
                Spacer()
                
                VStack {
                    NavigationLink {
                        // TODO: 다이어리 생성 View
                    } label: {
                        Text("주인으로 강아지네 새로 만들기")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.99, blue: 0.99))
                    }
                    .frame(width: 343, height: 45)
                    .background(Color(red: 0.99, green: 0.61, blue: 0.07))
                    .cornerRadius(10)
                    
                    
                    NavigationLink {
                        InviteCodeView()
                    } label: {
                        Text("가족 및 지인으로 등록하기 (초대 코드)")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.99, blue: 0.99))
                    }
                    .frame(width: 343, height: 45)
                    .background(Color(red: 0.24, green: 0.15, blue: 0.04))
                    .cornerRadius(10)
                    
                    
                }// 버튼 VStack
                .padding(.bottom, 3)
                
            } // 전체 화면 VStack
        } // 네비게이션 View 끝
    }
}

struct AddDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        AddDiaryView()
    }
}
