//
//  MyPageView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/07.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                UserProfilView()
                MyPageMenuListView()
            }
            .navigationBarTitle("마이페이지", displayMode: .inline)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}

struct UserProfilView: View {
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, content: {
                HStack {
                    Text("강아지 밥 주는 사람")  // TODO: 유저 닉네임으로 변경
                        .font(Font.system(size: 13))
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink {
                        SetNotificationView()
                    } label: {
                        Text("알림설정")
                            .font(Font.system(size: 10))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Capsule().foregroundColor(Color(red: 255/255, green: 243/255, blue: 224/255)))
                    }
                    NavigationLink {
                        EditProfileView()
                    } label: {
                        Text("프로필 수정")
                            .font(Font.system(size: 11))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Capsule().foregroundColor(Color(red: 255/255, green: 243/255, blue: 224/255)))
                    }
                }
                
                Text("010-0000-0000")   // TODO: 유저 전화번호로 변경
                    .font(Font.system(size: 10))
            })
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            .background(Color(red: 255/255, green: 251/255, blue: 243/255))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 255/255, green: 217/255, blue: 133/255), lineWidth: 0.5)
            )
            

            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
    }
}

struct MyPageMenuListView: View {
    var body: some View {
        VStack {
            List {
                getHeaderTitle(title: "계정 설정")
                    .padding(.top, 20)
                Group {
                    MyPageMenuRow(iconName: "pro-version", menuName: "Pro 버전")
                    MyPageMenuRow(iconName: "log-out", menuName: "로그아웃")
                    MyPageMenuRow(iconName: "sign-out", menuName: "회원 탈퇴")
                }
                divider
                
                getHeaderTitle(title: "고객 지원")
                Group {
                    MyPageMenuRow(iconName: "notice", menuName: "공지사항")
                    MyPageMenuRow(iconName: "send", menuName: "로그아웃")
                }
                
                divider

                getHeaderTitle(title: "앱 정보")
                Group {
                    MyPageMenuRow(iconName: "term", menuName: "약관 안내")
                    MyPageMenuRow(iconName: "privacy-term", menuName: "개인정보 처리 방침")
                }
                
            }
            .environment(\.defaultMinListRowHeight, 5)
            .frame(height: 450)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 255/255, green: 217/255, blue: 133/255), lineWidth: 0.5)
            )
            .listStyle(.plain)
            .background(Color(red: 255/255, green: 251/255, blue: 243/255))

        }
        .padding(.horizontal, 20)
        
    }
    
    var divider: some View {
        Divider()
            .background(Color(red: 255/255, green: 217/255, blue: 133/255))
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
    }
    
    func getHeaderTitle(title: String) -> some View {
        var header: some View {
            Text(title)
                .font(Font.system(size: 10))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 109/255, green: 109/255, blue: 109/255))
                .frame(height: 0)
                .listRowBackground(Color.clear)
        }
        return header
    }
}

struct MyPageMenuRow: View {
    var iconName: String
    var menuName: String
//    var destinationView: View
    
    var body: some View {
//        NavigationLink {
//            destinationView
//        } label: {
            HStack {
                HStack {
                    Image(iconName)
                    Text(menuName)
                        .font(Font.system(size: 12))
                        .fontWeight(.medium)
                        .padding(.leading, 10)
                }
                Spacer()
                Image("arrow-gray")
                    .frame(width: 20, height: 20)
            }
            .frame(height: 20)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
//    }
    
}
