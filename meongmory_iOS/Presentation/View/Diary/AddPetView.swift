//
//  AddPetView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/09.
//

import SwiftUI

struct AddPetView: View {
    var body: some View {
        @State var petName: String = ""
        
        
        NavigationView {
            VStack {
                VStack(alignment: .center, spacing: 6) {
                    Image("Ellipse 215")
                        .frame(width: 89, height: 89)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(89 / 2)
                    
                    Text("대표 사진")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                } // 사진 VStack
                .padding(.top, 0)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("반려동물 이름")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                        Spacer()
                    }
                   
                    
                    TextField("반려동물 이름 입력", text: $petName)
                        .frame(height: 39)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                       
                }// 반려동물 이름 VStack
                .padding(.horizontal, 16)
                .padding(.top, 29)
                
                
                VStack(spacing: 10) {
                    HStack {
                        Text("반려동물 이름")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                        Spacer()
                    }
                   
                    
                    TextField("반려동물 이름 입력", text: $petName)
                        .frame(height: 39)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                    
                } // 반려동물 품종 VStack
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("반려동물 이름")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                        Spacer()
                    }
                   
                    
                    TextField("반려동물 이름 입력", text: $petName)
                        .frame(height: 39)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                    
                } // 반려동물 성별 VStack
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("반려동물 이름")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                        Spacer()
                    }
                   
                    
                    TextField("반려동물 이름 입력", text: $petName)
                        .frame(height: 39)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                } // 반려동물 나이 VStack
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("반려동물 이름")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                        Spacer()
                    }
                   
                    
                    TextField("반려동물 이름 입력", text: $petName)
                        .frame(height: 39)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                } // 반려동물 입양날짜 VStack
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("반려동물 이름")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                        Spacer()
                    }
                   
                    
                    TextField("반려동물 이름 입력", text: $petName)
                        .frame(height: 39)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                } // 반려동물 등록번호 VStack
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                
                NavigationLink {
                    // TODO: 강아지 등록 페이지
                    AddPetView()
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
                .padding(.top, 21)
            } // 전체 VStack
        }
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
