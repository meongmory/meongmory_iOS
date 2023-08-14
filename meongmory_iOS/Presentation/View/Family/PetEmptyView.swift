//
//  PetEmptyView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct PetEmptyView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 37) {
                PetAddButton()
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 63)
                            .background(Color(red: 0.99, green: 0.61, blue: 0.07).opacity(0.03))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.99, green: 0.61, blue: 0.07).opacity(0.43), lineWidth: 1)
                            )
                        VStack(alignment: .leading, spacing: 0) {
                            Text("아직 반려동물을 등록하지 않으셨네요!")
                                .font(Font.system(size: 10))
                                .fontWeight(.regular)
                                .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                                .frame(height: 19)
                            HStack(spacing: 5) {
                                HStack(spacing: 0) {
                                    Text("반려동물을 등록")
                                        .fontWeight(.semibold)
                                    Text("하고 ")
                                        .fontWeight(.regular)
                                    Text("추억을 기록")
                                        .fontWeight(.semibold)
                                    Text("해보세요!")
                                        .fontWeight(.regular)
                                }
                                .font(Font.system(size: 10))
                                .foregroundColor(.black)
                                Image("pen")
                            }
                            .frame(height: 19)
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 33)
                }
            }
            .padding(.top, 10)
            .padding(.leading, 16)
            .padding(.trailing, 33)
            .padding(.bottom, 14)
            
            Divider()
        }
    }
}

struct PetEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        PetEmptyView()
    }
}

struct PetAddButton: View {
    var body: some View {
        VStack(spacing: 11) {
            Button(action: {
                // TODO: 반려동물 추가 화면으로 이동
            }, label: {
                Image("plus_gray")
                    .frame(width: 68, height: 68)
                    .overlay(
                        Circle()
                            .stroke(Color(red: 0.91, green: 0.91, blue: 0.91), lineWidth: 2)
                    )
            })
            
            Text("펫 추가하기")
              .font(Font.system(size: 10))
              .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
              .frame(height: 20)
        }
    }
}
