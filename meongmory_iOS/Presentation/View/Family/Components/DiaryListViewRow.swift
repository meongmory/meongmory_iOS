//
//  DiaryListViewRow.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/21.
//

import SwiftUI

struct DiaryListViewRow: View {
    var petList: [String]
    var date: String
    var numOfMedia: Int
    
    // api 연결시 모델로 받아와서 init - 사진/동영상 리스트도 추가
    init(petList: [String], date: String, numOfMedia: Int) {
        self.petList = petList
        self.date = date
        self.numOfMedia = numOfMedia
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 13) {
                HStack(spacing: 0) {
                    HStack(spacing: 8) {
                        HStack(spacing: 0) {
                            var petNames: Text {
                                var petNames = ""
                                for idx in petList.indices {
                                    if idx == petList.count-1 {
                                        petNames = petNames + petList[idx]
                                    } else {
                                        petNames = petNames + petList[idx] + ", "
                                    }
                                }
                                return Text(petNames)
                            }
                            petNames
                                .font(Font.system(size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(height: 20)
                        }
                        Text("\(date)")
                            .font(Font.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(height: 20)
                    }
                    Spacer()
                    Button(action: {
                        // TODO: 다이어리 상세 화면으로 이동
                    }, label: {
                        Image("chevron_right")
                    })
                }
                .padding(.trailing, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top) {
                        ForEach(0..<numOfMedia, id: \.self) { idx in
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 120, height: 120)
                                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .cornerRadius(5)
                        }
                    }
                    .fixedSize()
                    .padding(.trailing, 16)
                }
            }
            .padding(.top, 13)
            .padding(.leading, 16)
            .padding(.bottom, 19)
            Divider()
        }
    }
}

struct DiaryListViewRow_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListViewRow(petList: ["루비", "밍키", "옥수수", "루비", "밍키", "옥수수", "루비", "밍키"], date: "2023년 8월 21일", numOfMedia: 5)
    }
}
