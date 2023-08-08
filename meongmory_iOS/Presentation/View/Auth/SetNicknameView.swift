//
//  SetNicknameView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/04.
//

import SwiftUI

struct SetNicknameView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let guideTitle1 = "환영합니다!💌";
    let guideTitle2 = "자신만의 개성있는 닉네임을 정해보세요!";
    
    @State var nickname: String = ""
    
    var body: some View {
        VStack(alignment: .leading, content: {
            titleGuideStack
                .padding(.top, 80)
            setNicknameView
            
            Spacer()
            bottomButton
        })
        .padding(.top, 40)
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
    
    var titleGuideStack: some View {
        VStack(alignment: .leading, content: {
            Text(guideTitle1)
                .font(Font.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 252/255, green: 156/255, blue: 19/255))
                .padding(.vertical, 5)
                .lineSpacing(4)
            
            Text(guideTitle2)
                .font(Font.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(Color(red: 69/255, green: 69/255, blue: 69/255))
                .padding(.bottom, 30)
                .lineSpacing(4)
        })
    }
    
    var setNicknameView: some View {
        VStack(alignment: .leading) {
            Text("닉네임")
                .font(Font.system(size: 12))
                .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))
            
            TextField("닉네임 입력", text: $nickname)
                .font(Font.system(size: 12))
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .background((nickname.count > 0)
                            ? Color(red: 255/255, green: 249/255, blue: 236/255)
                            : Color(red: 249/255, green: 249/255, blue: 249/255))
                .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke((nickname.count > 0)
                                ? Color(red: 255/255, green: 216/255, blue: 129/255)
                                : Color(red: 231/255, green: 231/255, blue: 231/255), lineWidth: 1))
            
            Text("한글/영문/숫자/띄어쓰기 포함 최대 6자리까지 입력 가능해요.")
                .font(Font.system(size: 10))
                .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))
        }
        
    }
    
    var bottomButton: some View {
        NavigationLink {
            OnBoardingView()
        } label: {
            Text("가입하기")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
        }
        .navigationBarBackButtonHidden(true)
        .background((nickname.count > 0)
                    ? Color(red: 252/255, green: 156/255, blue: 19/255)
                    : Color(red: 217/255, green: 217/255, blue: 217/255))
        .cornerRadius(10)
    }
}

struct SetNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        SetNicknameView()
    }
}
