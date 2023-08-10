//
//  NotificationView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

struct NoticeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        List {
            // TODO: api 연결 후 ForEach문으로 변경
            Group {
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            Group {
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                NoticeRow()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
        .padding(.top, 20)
        
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

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
    }
}
