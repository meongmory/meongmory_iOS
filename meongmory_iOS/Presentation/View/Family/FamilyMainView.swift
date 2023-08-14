//
//  FamilyMainView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct FamilyMainView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Divider()
                ScrollView {
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 6) {
                        Text("유상이네")
                            .font(Font.custom("AppleSDGothicNeoB00", size: 18))
                            .foregroundColor(.black)
                        Button(action: {}, label: {
                            Image("chevron_down")
                        })
                    }
                    .onTapGesture {
                        // TODO: 디자인 요청
                    }
                }
                
                /* 본인이 강아지네 가족에 해당될 경우에만 보임 */
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // TODO: 강아지네 관리 화면으로 이동
                    }, label: {
                        Image("users")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // TODO: 기록 추가 화면으로 이동
                    }, label: {
                        Image("plus")
                    })
                }
                /* -- */
            }
        }
    }
}

struct FamilyMainView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyMainView()
    }
}
