//
//  ValidatePhoneNumView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/01.
//

import SwiftUI

struct ValidatePhoneNumView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let guideTitle1 = "안녕하세요! \n휴대폰 번호로 로그인 해주세요!";
    let guideTitle2 = "휴대폰 번호는 안전하게 보관되어\n이웃에게 공개되지 않아요.";
    let guideForSendValidationCode = "인증번호를 발송했습니다. (유효시간 30분)\n인증번호가 오지 않으면 입력하신 정보가 정확한지 확인해주세요.\n이미 가입된 번호이거나, 가상 전화번호는 인증번호를 받을 수 없습니다.";
    
    let successToValidate = "인증되었습니다.";
    let failToValidate = "인증번호가 일치하지 않습니다.\n 다시 시도해주세요.";
    
    @State var phoneNum: String = ""
    @State var validationCode: String = ""
    @State var sendValidationCode: Bool = false
    @State var isValidated: Bool = false
    
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, content: {
                titleGuideStack
                phoneNumInputView
                
                inputValidationCodeView
                    .padding(.bottom, 10)
                validationCodeGuideView
                
                Spacer()
                bottomButton
                
            })
            .padding(.top, 40)
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
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
    
    var phoneNumInputView: some View {
        VStack(alignment: .leading, content: {
            Text("휴대폰 번호")
                .font(Font.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))
            
            TextField("-없이 숫자만 입력", text: $phoneNum)
                .font(Font.system(size: 12))
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .background(Color(red: 249/255, green: 249/255, blue: 249/255))
                .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke((phoneNum.count > 0)
                                ? Color(red: 128/255, green: 128/255, blue: 128/255)
                                : Color(red: 231/255, green: 231/255, blue: 231/255), lineWidth: 1))
            
            Button {
                // TODO: 인증번호 발송 요청
                sendValidationCode.toggle()
            } label: {
                Text("인증번호 받기")
                    .font(Font.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 11)
                    .frame(maxWidth: .infinity)
                
            }.background((phoneNum.count > 0)
                         ? Color(red: 69/255, green: 69/255, blue: 69/255)
                         : Color(red: 217/255, green: 217/255, blue: 217/255))
            .cornerRadius(8)
            .padding(.bottom, 30)
            
        })
    }
    
    var inputValidationCodeView: some View {
        HStack {
            TextField("인증번호 입력", text: $validationCode)
                .font(Font.system(size: 12))
                .padding(.vertical, 8)
                .padding(.leading, 12)
                .background(Color(red: 249/255, green: 249/255, blue: 249/255))
                .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke((validationCode.count > 0)
                                ? Color(red: 128/255, green: 128/255, blue: 128/255)
                                : Color(red: 231/255, green: 231/255, blue: 231/255), lineWidth: 1)
                )
            
            Button {
                // TODO: 인증요청 발송
                isValidated.toggle()    // for test
                
            } label: {
                Text("인증 요청")
                    .font(Font.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
            }
            .background((validationCode.count > 0)
                        ? Color(red: 69/255, green: 69/255, blue: 69/255)
                        : Color(red: 217/255, green: 217/255, blue: 217/255))
            .cornerRadius(8)
            .frame(width: 100)
            .alert(isPresented: $isValidated) {
                Alert(title: isValidated ? Text(successToValidate) : Text(failToValidate))
            }
        }
    }
    
    var validationCodeGuideView: some View {
        Text(guideForSendValidationCode)
            .lineSpacing(4)
            .font(Font.system(size: 11))
            .foregroundColor(sendValidationCode
                             ? Color(red: 203/255, green: 93/255, blue: 91/255)
                             : Color.white)
    }
    
    var bottomButton: some View {
        NavigationLink {
            // TODO: 약관 동의 화면으로 전환
        } label: {
            Text("다음")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
        }
        .background(isValidated
                    ? Color(red: 252/255, green: 156/255, blue: 19/255)
                    : Color(red: 217/255, green: 217/255, blue: 217/255))
        .cornerRadius(10)
    }
}

struct ValidatePhoneNumView_Previews: PreviewProvider {
    static var previews: some View {
        ValidatePhoneNumView()
    }
}
