//
//  MapInfoView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/08.
//

import SwiftUI

struct MapInfoView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 2)
            
            VStack {
                HStack {
                    Text("이름")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 16))
                        .foregroundColor(.black)
                        .padding(.leading, 14)
                        .padding(.trailing, 7)
                    
                    ZStack {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 20)
                        .background(Color(red: 0.94, green: 0.97, blue: 1))
                        .cornerRadius(4)
                        
                        Text("카테고리")
                            .font(Font.custom("AppleSDGothicNeoM00", size: 10))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.98))
                            .padding(.horizontal, 5)
                    }.fixedSize()
                    
                    Spacer()
                    
                    Button {
                        // TODO: 버튼 액션 - 네이버 지도 혹은 홈페이지로 이동하기
                    } label: {
                        Image("map_info")
                    }.padding(.trailing, 5)
                }.padding(.top, 12)
                // 이름 + 카테고리 + > 버튼 HStack 끝
                
                HStack {
                    Text("3.2km • 서울 마포구 서교동 395-84")
                    .font(Font.custom("AppleSDGothicNeoSB00", size: 11))
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    
                    Spacer()
                }
                .padding(.leading, 14)
                .padding(.top, 3)
                // 거리 + 주소 Hstack 끝
                
                HStack(spacing: 25) {
                    // TODO: 이미지 서버에서 받아온걸로 변경
                    Image(systemName: "icloud.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 141, height: 97)
                    
                    Image(systemName: "icloud.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 141, height: 97)
                }
                .padding(.horizontal, 14)
                .padding(.top, 7)
                // 이미지 HStack 끝
                
                HStack(spacing: 9) {
                    Button {
                        // TODO: 버튼 액션 - 네이버 지도 혹은 홈페이지로 이동하기
                    } label: {
                        Image("map_phone")
                            .frame(width: 20, height: 20)
                    }
                        .frame(width: 29, height: 29)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(29/2)
                        .padding(.leading, 14)
                    
                    Button {
                        // TODO: 버튼 액션 - 네이버 지도 혹은 홈페이지로 이동하기
                    } label: {
                        Image("map_find")
                            .frame(width: 20, height: 20)
                    }
                        .frame(width: 29, height: 29)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(29/2)
                    
                    Spacer()
                }
                .padding(.top, 9)
                .padding(.bottom, 10)
                // 전화 및 길찾기 버튼 HStack 끝
                
            } // VStack 끝
        }
        .frame(width: 335, height: 207)
        // ZStack 끝
    }
}

struct MapInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MapInfoView()
            .previewLayout(.sizeThatFits)
    }
}
