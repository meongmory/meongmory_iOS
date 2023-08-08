//
//  ProVersionView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

struct ProVersionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("Pro 버전에 가입해서\n나만의 펫다이어리를 완성하세요!")
                .font(Font.system(size: 18))
                .fontWeight(.semibold)
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
                .padding(.top, 70)
            
            Text("언제든 해지할 수 있어요")
                .font(Font.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(.gray.opacity(0.6))
                .padding(.bottom, 50)
            
            VStack {
                Text(getAttributedStr(text: "Pro version",
                                      color: Color(red: 252/255, green: 156/255, blue: 19/255),
                                      fontStyle: Font.system(size: 14, weight: .bold))
                    + " 구독 시 누릴 수 있는")
                    .font(Font.system(size: 14))
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                    .padding(.bottom, 1)
                
                Text("혜택 2가지 👏")
                    .font(Font.system(size: 16))
                    .fontWeight(.medium)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top, content: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color(red: 252/255, green: 156/255, blue: 19/255))
                        Text("갤러리에 동영상 업로드 시,\n"
                             + getAttributedStr(text: "개수 제한없이 ", color: .black, fontStyle: Font.system(size: 14, weight: .semibold))
                             + "세심하게 기록")
                            .font(Font.system(size: 14))
                            .lineSpacing(2)
                    })
                    .padding(.vertical, 10)
                    
                    HStack(alignment: .top, content: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color(red: 252/255, green: 156/255, blue: 19/255))
                        Text("메인화면 "
                             + getAttributedStr(text: "광고없이 ", color: .black, fontStyle: Font.system(size: 14, weight: .semibold))
                             + "내 다이어리에 집중")
                            .font(Font.system(size: 14))
                    })
                    .padding(.vertical, 10)
                }
                
            }
            .padding(.vertical, 30)
            .padding(.horizontal, 40)
            .background(Color(red: 252/255, green: 156/255, blue: 19/255).opacity(0.03))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 252/255, green: 156/255, blue: 19/255).opacity(0.45), lineWidth: 2)
            )
            
            VStack {
                Text("4900/월 - VAT 포함")
                    .font(Font.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.gray.opacity(0.8))
                
                Text("반복결제 - 언제든지 해지 가능")
                    .font(Font.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.gray.opacity(0.8))
            }
            .padding(.top, 50)
            
            
            Spacer()
            
            bottomButton
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
    
    var bottomButton: some View {
       Button {
           // TODO: Pro 버전 결제 요청
           
       } label: {
           Text("Pro 가입하기")
               .fontWeight(.medium)
               .foregroundColor(Color.white)
               .frame(maxWidth: .infinity)
               .padding(.vertical, 15)
       }
       .navigationBarBackButtonHidden(true)
       .background(Color(red: 254/255, green: 194/255, blue: 61/255))
       .cornerRadius(10)
   }
    
    
    func getAttributedStr(text: String, color: Color?, fontStyle: Font?) -> AttributedString {
        var attributed: AttributedString {
            var result = AttributedString(text)
            result.font = fontStyle ?? .none
            result.foregroundColor = color ?? .black
            return result
       }
        return attributed
    }
}

struct ProVersionView_Previews: PreviewProvider {
    static var previews: some View {
        ProVersionView()
    }
}
