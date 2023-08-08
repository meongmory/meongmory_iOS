//
//  SetNotificationView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

enum NotificationType: String {
    case notice = "공지 알림"
    case comment = "소식 및 댓글 알림"
    case marketing = "공지 마케팅 알림"
}


struct SetNotificationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NotificationSettingListView()
        .navigationBarBackButtonHidden(true)
        .navigationTitle("알림 설정")
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

struct SetNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        SetNotificationView()
    }
}

struct NotificationSettingListView: View {
    @State var notificationAlarm = false
    @State var commentAlarm = false
    @State var marketingAlarm = false
    
    var body: some View {
        VStack {
            List {
                getToggleSwitch(type: .notice)
                getToggleSwitch(type: .comment)
                getToggleSwitch(type: .marketing)
            }
            .frame(height: 200)
            .padding(.top, 20)
            .listStyle(.plain)
            
            Spacer()
        }
    }
    
    
    func getIsOnBindingValue(type: NotificationType) -> Binding<Bool> {
        switch type {
        case .notice:
            return $notificationAlarm
        case .comment:
            return $commentAlarm
        case .marketing:
            return $marketingAlarm
        }
    }
    
    func getIsOnValue(type: NotificationType) -> Bool {
        switch type {
        case .notice:
            return notificationAlarm
        case .comment:
            return commentAlarm
        case .marketing:
            return marketingAlarm
        }
    }
    
    func getToggleSwitch(type: NotificationType) -> some View {
        var toggle: some View {
            Toggle(isOn: getIsOnBindingValue(type: type)){
                Text(type.rawValue)
                    .font(Font.system(size: 16))
                    .fontWeight(.medium)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .toggleStyle(SwitchToggleStyle(tint: Color(red: 254/255, green: 194/255, blue: 61/255)))
            .onChange(of: getIsOnValue(type: type)) { newValue in
                print("\(type.rawValue) 설정 변경 -> \(newValue)")
            }
        }
        return toggle
    }
}
