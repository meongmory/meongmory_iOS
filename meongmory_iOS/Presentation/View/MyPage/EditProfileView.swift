//
//  EditProfileView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var newNickname: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            setNicknameView
            Spacer()
            bottomButton
        })
        .padding(.top, 40)
        .padding(.horizontal, 20)

        .navigationBarBackButtonHidden(true)
        .navigationTitle("프로필 수정")
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
    
    var setNicknameView: some View {
            VStack(alignment: .leading) {
                Text("닉네임")
                    .font(Font.system(size: 12))
                    .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))

                TextField("닉네임 입력", text: $newNickname)
                    .font(Font.system(size: 12))
                    .padding(.vertical, 12)
                    .padding(.leading, 12)
                    .background((newNickname.count > 0)
                                ? Color.white
                                : Color(red: 249/255, green: 249/255, blue: 249/255))
                    .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(red: 231/255, green: 231/255, blue: 231/255), lineWidth: 1))

                Text("한글/영문/숫자/띄어쓰기 포함 최대 6자리까지 입력 가능해요.")
                    .font(Font.system(size: 10))
                    .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))
            }
            .padding(.top, 200)

        }
    
    var bottomButton: some View {
           Button {
               // TODO: 닉네임 수정 요청
               print("변경 요청할 새 닉네임 -> \(newNickname)")
           } label: {
               Text("수정하기")
                   .fontWeight(.bold)
                   .foregroundColor(Color.white)
                   .frame(maxWidth: .infinity)
                   .padding(.vertical, 10)
           }
           .navigationBarBackButtonHidden(true)
           .background(newNickname.isEmpty
                       ? Color(red: 217/255, green: 217/255, blue: 217/255)
                       : Color(red: 252/255, green: 156/255, blue: 19/255))
           .cornerRadius(10)
       }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
