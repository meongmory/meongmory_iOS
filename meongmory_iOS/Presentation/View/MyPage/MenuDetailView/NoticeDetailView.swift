//
//  NoticeDetailView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/10.
//

import SwiftUI

struct NoticeDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            // TODO: 공지사항 세부 내용 표시
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("공지사항")
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
}

struct NoticeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeDetailView()
    }
}
