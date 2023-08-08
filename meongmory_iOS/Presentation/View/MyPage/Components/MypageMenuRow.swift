//
//  MypageMenuRow.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/08.
//

import SwiftUI

struct MypageMenuRow: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var menuDetail: MenuDetail
    @State var alertShowing: Bool = false
    
    private let logoutMessage = "로그아웃 하시겠습니까?"
    private let signoutMessage = "회원 탈퇴 시,\n저장된 모든 정보를 잃게 됩니다.\n탈퇴하시겠습니까?"
    
    var body: some View {
        switch menuDetail {
        case .logout, .signout :
            getAlertRow()
        default:
            normalRow
        }
        
    }
    
    var normalRow: some View {
        NavigationLink {
            menuDetail.view
        } label: {
            HStack {
                HStack {
                    Image(menuDetail.iconName)
                    Text(menuDetail.rawValue)
                        .font(Font.system(size: 12))
                        .fontWeight(.medium)
                        .padding(.leading, 10)
                }
                Spacer()
            }
            .frame(height: 20)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
    
    func getAlertRow() -> some View {
        var row: some View {
            Button {
                alertShowing.toggle()
                print("did Tap alertRow")

            } label: {
                HStack {
                    HStack {
                        Image(menuDetail.iconName)
                        Text(menuDetail.rawValue)
                            .font(Font.system(size: 12))
                            .fontWeight(.medium)
                            .padding(.leading, 10)
                    }
                    Spacer()
                    
                }
                .frame(height: 20)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .alert((menuDetail == .logout) ? "로그아웃" : "회원 탈퇴",
                   isPresented: $alertShowing) {
                Button("취소", role: .cancel) {}
                Button((menuDetail == .logout) ? "로그아웃" : "탈퇴") {
                    if menuDetail == .logout {
                        print("로그아웃 요청하기")
                    } else {
                        print("회원탈퇴 요청하기")
                    }
                }
            } message: {
                Text((menuDetail == .logout) ? logoutMessage : signoutMessage)
            }
        }
        return row
    }
    
    
    
    
}

struct MypageMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MypageMenuRow(menuDetail: MenuDetail.proVersion)
    }
}
