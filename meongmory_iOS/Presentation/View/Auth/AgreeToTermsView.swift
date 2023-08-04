//
//  AgreeToTermsView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/04.
//

import SwiftUI

struct Term {
    let condition: String
    let content: String
    @State var isAgree: Bool
}

struct AgreeToTermsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let guideTitle1 = "환영합니다!🎉";
    let guideTitle2 = "펫다이어리 서비스를 이용하기 위해서는 아래의 약관 동의 및 회원가입이 필요합니다.";
    
    @State var isAllAgree: Bool = false
    @State var terms: [Term] = [
        Term(condition: "필수", content: "이용 약관 동의", isAgree: false),
        Term(condition: "필수", content: "개인 정보 수집 및 이용 동의", isAgree: false),
        Term(condition: "선택", content: "E-mail 및 SMS 광고성 정보 수신 동의", isAgree: false)
    ]
    
    var body: some View {
            
        VStack(alignment: .leading, content: {
            titleGuideStack
            allAgreeView
            Divider()
                .padding(.vertical, 5)
            
//            terms.forEach { term in
//                getAgreeOfTermView(term: term)
//            }
            getAgreeOfTermView(term: terms[0])
            getAgreeOfTermView(term: terms[1])
            getAgreeOfTermView(term: terms[2])
            
            
            Spacer()
            bottomButton
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
                .padding(.bottom, 30)
                .lineSpacing(4)
        })
    }
    
    
    
    var allAgreeView: some View {
        HStack(alignment: .firstTextBaseline, content: {
            Button {
                // TODO: 필수 약관이 모두 동의됐으면 하단 버튼 활성화
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color(red: 219/255, green: 219/255, blue: 219/255))
            }
            .frame(width: 25.0, height: 25.0)
            
            VStack(alignment: .leading) {
                Text("[필수?] 약관")
                    .font(Font.system(size: 14))
                    .fontWeight(.medium)
                    .padding(.bottom, 2)
                    
                Text("서비스 이용을 위해 아래 약관에 모두 동의합니다.")
                    .font(Font.system(size: 12))
                    .foregroundColor(Color(red: 69/255, green: 69/255, blue: 69/255))
                    .lineSpacing(4)
            }
            
        })
       
    }
    
    
    var bottomButton: some View {
        NavigationLink {
            SetNicknameView()
        } label: {
            Text("동의하고 시작하기")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
        }
        .navigationBarBackButtonHidden(true)
        .background(isAllAgree
                    ? Color(red: 252/255, green: 156/255, blue: 19/255)
                    : Color(red: 217/255, green: 217/255, blue: 217/255))
        .cornerRadius(10)
    }
    
    func getAgreeOfTermView(term: Term) -> some View {
        var agreeOfTerm: some View {
            HStack(alignment: .firstTextBaseline, content: {
                Button {
                    term.isAgree.toggle()
                    print("동의함? \(term.isAgree)")
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(term.isAgree
                                         ? Color(red: 252/255, green: 156/255, blue: 19/255)
                                         : Color(red: 219/255, green: 219/255, blue: 219/255))
                }
                .frame(width: 25.0, height: 25.0)

                Text("[\(term.condition)] \(term.content)")
                    .font(Font.system(size: 14))
            })
        }
        return agreeOfTerm
    }
}

struct AgreeToTermsView_Previews: PreviewProvider {
    static var previews: some View {
        AgreeToTermsView()
    }
}
