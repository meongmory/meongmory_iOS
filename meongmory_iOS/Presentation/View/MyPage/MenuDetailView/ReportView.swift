//
//  ReportView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

struct ReportView: View {
    
    @State var emailHead: String = ""
    @State var emailTail: String = ""
    @State var content: String = ""
    @State var contentPlaceholder: String = "각종 문의나 오류 제보에 있어 자유롭게 적어주세요."
    
    var body: some View {
        VStack(alignment: .leading) {
            getTitleText(title: "답변 받을 이메일")
            inputEmailView
            getTitleText(title: "내용")
            contentDetailView
        }
        .padding(.horizontal, 20)
    }
    
    var inputEmailView: some View {
        HStack {
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
            
            // drop down button

        }
    }
    
    var contentDetailView: some View {
        TextEditor(text: content.isEmpty ? $contentPlaceholder : $content)
            .font(Font.system(size: 12))
            .padding(.vertical, 12)
            .padding(.leading, 12)
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
    
    func getTitleText(title: String) -> some View {
        var titleText: some View {
            Text(title)
                .font(Font.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 69/255, green: 69/255, blue: 69/255))
        }
        return titleText
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
