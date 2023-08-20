//
//  AddPetView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/20.
//

import SwiftUI

struct AddPetView: View {
    @State var petName: String = ""
    @State var petKind: String = "aa"
    @State var petGender: String = ""
    @State var petAge: String = ""
    @State var petYear: String = ""
    @State var petMonth: String = ""
    @State var petDay: String = ""
    @State var petNum: String = ""
    
    
    var body: some View {
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
            } // MARK: 사진 VStack
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
                    .background(petName != "" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(10)
                    .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                    .foregroundColor(petName != "" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))


                   
            }// MARK: 반려동물 이름 VStack
            .padding(.horizontal, 16)
            .padding(.top, 29)
            
            
            VStack(spacing: 10) {
                HStack {
                    Text("품종")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    Spacer()
                }
               
                
                NavigationLink {
                    // TODO: 품종 찾기
                } label: {
                    Text("만들기")
                        .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                }
                .frame(width: CGFloat.screenWidth - 32, height: 39)
                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                .cornerRadius(10)
                
                
                
                
            } // MARK: 반려동물 품종 VStack
            .padding(.horizontal, 16)
            .padding(.top, 12)
            
            VStack(spacing: 10) {
                HStack {
                    Text("성별")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    Spacer()
                }
                
                HStack(spacing: 30) {
                    Button {
                        petGender = "수컷"
                    } label: {
                        Text("수컷")
                            .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(petGender == "수컷" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))

                    }.frame(width: (CGFloat.screenWidth - 47) / 2, height: 39)
                        .background(petGender == "수컷" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                    
                    Button {
                        petGender = "암컷"
                    } label: {
                        Text("암컷")
                            .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(petGender == "암컷" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))
                        
                    }.frame(width: (CGFloat.screenWidth - 47) / 2, height: 39)
                        .background(petGender == "암컷" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(10)
                    
                }
               
            } // MARK: 반려동물 성별 VStack
            .padding(.horizontal, 16)
            .padding(.top, 12)
            
            VStack(spacing: 10) {
                HStack {
                    Text("나이")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    Spacer()
                }
               
                
                TextField("나이 입력", text: $petAge)
                    .frame(height: 39)
                    .background(petAge != "" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                    .foregroundColor(petAge != "" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)
            } // MARK: 반려동물 나이 VStack
            .padding(.horizontal, 16)
            .padding(.top, 12)
            
            VStack(spacing: 10) {
                HStack {
                    Text("입양한 날짜")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    Spacer()
                }
                
                HStack {
                    TextField("년", text: $petYear)
                        .frame(height: 39)
                        .background(petYear != "" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                        .foregroundColor(petYear != "" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))
                        .cornerRadius(10)
                        .keyboardType(.numberPad)
                    
                    Text("년")
                        .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    
                    TextField("월", text: $petMonth)
                        .frame(height: 39)
                        .background(petMonth != "" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                        .foregroundColor(petMonth != "" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))
                        .cornerRadius(10)
                        .keyboardType(.numberPad)
                    
                    Text("월")
                        .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    
                    TextField("일", text: $petDay)
                        .frame(height: 39)
                        .background(petDay != "" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                        .foregroundColor(petDay != "" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))
                        .cornerRadius(10)
                        .keyboardType(.numberPad)
                    
                    Text("일")
                        .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                }
            } // MARK: 반려동물 입양날짜 VStack
            .padding(.horizontal, 16)
            .padding(.top, 12)
            
            VStack(spacing: 10) {
                HStack {
                    Text("반려동물 등록번호")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    Spacer()
                }
               
                
                TextField("반려동물 등록번호 입력", text: $petNum)
                    .frame(height: 39)
                    .background(petNum != "" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                    .foregroundColor(petNum != "" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)
            } // MARK: 반려동물 등록번호 VStack
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
            .frame(width: CGFloat.screenWidth - 32, height: 45)
            // 색상 변경 삼항연상자 쓰기
            .background(petName != "" && petKind != "" && petGender != "" && petAge != "" && petYear != "" && petMonth != "" && petDay != "" && petNum != "" ? Color(red: 0.99, green: 0.61, blue: 0.07) : Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(10)
            .padding(.top, 21)
        } // MARK: 전체 VStack
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
