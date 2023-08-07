//
//  ReportView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

enum EmailTailType: String {
    case google = "gmail.com"
    case naver = "naver.com"
    case daum = "daum.net"
}

struct ReportView: View {
    
    @State var emailHead: String = ""
    @State var emailTail: String = "naver.com"
    @State var content: String = ""
    @State var contentPlaceholder: String = "각종 문의나 오류 제보에 있어 자유롭게 적어주세요."
    
    @State var isDropdownTapped: Bool = false
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            getTitleText(title: "답변 받을 이메일")
            inputEmailView
            
            getTitleText(title: "내용")
                .padding(.top, 10)
            contentDetailView
            
            Spacer()
            
            bottomButton
        }
        .padding(.top, 50)
        .padding(.horizontal, 20)
        
    }
    
    var inputEmailView: some View {
        HStack(alignment: .top, content: {
            TextField("아이디(이메일)", text: $emailHead)
                .font(Font.system(size: 12))
                .padding(.vertical, 12)
                .padding(.leading, 12)
                .background(emailHead.isEmpty
                            ? Color(red: 249/255, green: 249/255, blue: 249/255)
                            : Color(red: 245/255, green: 244/255, blue: 242/255))
                .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(emailHead.isEmpty
                                ? Color(red: 231/255, green: 231/255, blue: 231/255)
                                : Color(red: 190/255, green: 183/255, blue: 173/255), lineWidth: 1))
            
            Text("@")
                .padding(.top, 7)
            
            emailTailDropDownButton
        })
    }
    
    var contentDetailView: some View {
        ZStack {
            if content.isEmpty {
                TextEditor(text: $contentPlaceholder)
                    .font(Font.system(size: 12))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .foregroundColor(content.isEmpty
                                     ? Color.gray.opacity(0.6)
                                     : Color.black)
                    .background(content.isEmpty
                                ? Color(red: 249/255, green: 249/255, blue: 249/255)
                                : Color(red: 245/255, green: 244/255, blue: 242/255))
                    .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(content.isEmpty
                                    ? Color(red: 231/255, green: 231/255, blue: 231/255)
                                    : Color(red: 190/255, green: 183/255, blue: 173/255), lineWidth: 1))
                    .frame(height: 140)
            }
        }
        
    }
    
    var emailTailDropDownButton: some View {
        VStack {
            Button {
                isDropdownTapped.toggle()
            } label: {
                VStack {
                    HStack {
                        Text(emailTail.isEmpty ? "선택" : emailTail)
                            .foregroundColor(emailTail.isEmpty ? .gray.opacity(0.6) : .black)
                            .font(Font.system(size: 12))
                            .padding(.vertical, 12)
                            .padding(.leading, 12)
                        Spacer()
                        Image("arrowtriangle.down.gray")
                            .padding(.trailing, 12)
                    }
                    if isDropdownTapped {
                        VStack(alignment: .leading, content: {
                            getEmailTailRow(type: .naver)
                            getEmailTailRow(type: .google)
                            getEmailTailRow(type: .daum)
                        })
                        .padding(.bottom, 10)
                    }
                }
            }
            .background(emailTail.isEmpty
                        ? Color(red: 249/255, green: 249/255, blue: 249/255)
                        : Color(red: 245/255, green: 244/255, blue: 242/255))
            .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(emailTail.isEmpty
                            ? Color(red: 231/255, green: 231/255, blue: 231/255)
                            : Color(red: 190/255, green: 183/255, blue: 173/255), lineWidth: 1))
        }
    }
    
    
    func getEmailTailRow(type: EmailTailType) -> some View {
        var emailTailRow: some View {
            Text(type.rawValue)
                .foregroundColor(.black)
                .font(Font.system(size: 12))
                .padding(.vertical, 2)
                .onTapGesture {
                    emailTail = type.rawValue
                    isDropdownTapped.toggle()
                    print("선택된 Email Tail -> \(emailTail)")
                }
        }
        return emailTailRow
    }
    
    var bottomButton: some View {
       Button {
           // TODO: 오류 제보 요청
       } label: {
           Text("수정하기")
               .fontWeight(.bold)
               .foregroundColor(Color.white)
               .frame(maxWidth: .infinity)
               .padding(.vertical, 10)
       }
       .navigationBarBackButtonHidden(true)
       .background(isAllInputed()
                   ? Color(red: 60/255, green: 39/255, blue: 10/255)
                   : Color(red: 217/255, green: 217/255, blue: 217/255))
       .cornerRadius(10)
   }
    
    func getTitleText(title: String) -> some View {
        var titleText: some View {
            Text(title)
                .font(Font.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 69/255, green: 69/255, blue: 69/255))
        }
        return titleText
    }
    
    func isAllInputed() -> Bool {
        return !emailHead.isEmpty && !emailTail.isEmpty && !content.isEmpty
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
