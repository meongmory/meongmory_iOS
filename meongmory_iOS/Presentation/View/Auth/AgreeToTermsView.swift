//
//  AgreeToTermsView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/04.
//

import SwiftUI



struct AgreeToTermsView: View {
    struct Term {
        var forced: Bool
        var content: String
        @State var isAgree: Bool
        var webUrl: TermType?
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let guideTitle1 = "환영합니다! 🎉";
    let guideTitle2 = "펫다이어리 서비스를 이용하기 위해서는 아래의 약관 동의 및 회원가입이 필요합니다.";
    
    @State var isAllAgree: Bool = false
    @State var terms: [Term] = [
        Term(forced: true, content: "이용 약관 동의", isAgree: false, webUrl: .term),
        Term(forced: true, content: "개인 정보 수집 및 이용 동의", isAgree: false, webUrl: .privacyTerm),
        Term(forced: false, content: "E-mail 및 SMS 광고성 정보 수신 동의", isAgree: false, webUrl: nil)
    ]
    
    var body: some View {
            
        VStack(alignment: .leading, content: {
            titleGuideStack
            allAgreeView
            Divider()
                .padding(.vertical, 5)
            
            getTermViewWithWeb(term: terms[0])
            getTermViewWithWeb(term: terms[1])
            getTermViewWithoutWeb(term: terms[2])
            
            
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
                terms.forEach { term in
                    if !term.isAgree { term.isAgree.toggle() }
                }
                isAllAgree.toggle()
                
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(isAllAgree
                                     ? Color(red: 252/255, green: 156/255, blue: 19/255)
                                     : Color(red: 219/255, green: 219/255, blue: 219/255))
            }
            .frame(width: 25.0, height: 25.0)
            
            VStack(alignment: .leading) {
                Text("약관 전체 동의")
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
    
    /// methods
    func getTermViewWithWeb(term: Term) -> some View {
        var agreeOfTerm: some View {
            NavigationLink {
                TermWebView(type: .term)
            } label: {
                getTermRowLabel(term: term)
            }
            .accentColor(.black)
        }
        return agreeOfTerm
    }

    
    func getTermViewWithoutWeb(term: Term) -> some View {
        return getTermRowLabel(term: term)
    }
    
    
    func getTermRowLabel(term: Term) -> some View {
        var label: some View {
            HStack(alignment: .firstTextBaseline, content: {
                Button {
                    term.isAgree.toggle()
                    
                    var result = false
                    terms.forEach { term in
                        if !(term.forced && term.isAgree) {
                            result = false
                        } else {
                            result = true
                        }
                    }
                    isAllAgree = result
                    
                    print("동의함? \(term.isAgree)")
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(term.isAgree
                                         ? Color(red: 252/255, green: 156/255, blue: 19/255)
                                         : Color(red: 219/255, green: 219/255, blue: 219/255))
                }
                .frame(width: 25.0, height: 25.0)

                Text("[\(term.forced ? "필수" : "선택")] \(term.content)")
                    .font(Font.system(size: 14))
            })
        }
        return label
    }
    
}

struct AgreeToTermsView_Previews: PreviewProvider {
    static var previews: some View {
        AgreeToTermsView()
    }
}
