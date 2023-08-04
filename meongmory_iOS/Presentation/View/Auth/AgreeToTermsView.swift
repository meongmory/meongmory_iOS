//
//  AgreeToTermsView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/04.
//

import SwiftUI

struct AgreeToTermsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let guideTitle1 = "환영합니다!🎉";
    let guideTitle2 = "펫다이어리 서비스를 이용하기 위해서는 아래의 약관 동의 및 회원가입이 필요합니다.";
    
    var body: some View {
            
        VStack(alignment: .leading, content: {
            titleGuideStack
            Spacer()
        })
        .padding(.top, 40)
        .padding(.horizontal, 20)

        .navigationBarBackButtonHidden(true)
        .navigationTitle("약관동의")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                }
            }
        }
        
    }
    
    var titleGuideStack: some View {
        VStack(alignment: .leading, content: {
            Text(guideTitle1)
                .font(Font.system(size: 20))
                .fontWeight(.semibold)
                .padding(.vertical, 10)
                .lineSpacing(4)
            
            Text(guideTitle2)
                .font(Font.system(size: 12))
                .foregroundColor(Color(red: 69/255, green: 69/255, blue: 69/255))
                .padding(.bottom, 50)
                .lineSpacing(4)
        })
    }
}

struct AgreeToTermsView_Previews: PreviewProvider {
    static var previews: some View {
        AgreeToTermsView()
    }
}
