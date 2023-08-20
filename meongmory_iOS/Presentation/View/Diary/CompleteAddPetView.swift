//
//  CompleteAddPetView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/20.
//

import SwiftUI

struct CompleteAddPetView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("complete1")
                    .padding(.leading, 60)
                    .padding(.top, 40)
                
                Image("complete2")
                    .padding(.leading, 150)
                    .padding(.top, 94)
                
                Image("complete3")
                    .padding(.trailing, 39.84)
                
                Image("complete4")
                    .padding(.leading, 20)
                
            }
            .padding(.leading, 81)
            .padding(.trailing, 45.2)
            
            Text("반려동물 등록 성공!")
                .font(Font.custom("AppleSDGothicNeoB00", size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.24, green: 0.15, blue: 0.04))
                .padding(.top, 31)
            
            Text("더 많은 반려동물 등록을 원하시나요?\n\(Text("반려동물 등록하기").foregroundColor(Color(red: 0.99, green: 0.61, blue: 0.07))) 버튼을 클릭해서\n다른 반려동물의 추억과 일정을 관리해보세요!")
                .font(Font.custom("AppleSDGothicNeoSB00", size: 14))
                .kerning(0.6)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                .padding(.top, 18)
            
            Button {
                
            } label: {
                Text("확인")
                    .font(Font.custom("AppleSDGothicNeoSB00", size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 1, green: 0.99, blue: 0.99))
            }
            .frame(width: CGFloat.screenWidth - 120, height: 45)
            .background(Color(red: 0.99, green: 0.61, blue: 0.07))
            .cornerRadius(10)
            .padding(.top, 22)
            

        }
    }
}

struct CompleteAddPetView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteAddPetView()
    }
}
