//
//  AddRecordView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/23.
//

import SwiftUI

// API 연동할 때 파일 다 옮기기
struct Pet: Codable {
    let type: String
    let name: String
    let age: Int
}

struct AddRecordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var petIsSelected = false
    // 서버 연동할 때 petList.count만큼 동적으로 init하는 걸로 바꾸기
    @State private var petSelectionList: [Bool] = [false, false, false, false, false]
    // 더미데이터
    private var petList: [Pet] = [Pet(type: "dog", name: "루비", age: 14), Pet(type: "dog", name: "밍키", age: 10), Pet(type: "dog", name: "옥수수", age: 8), Pet(type: "cat", name: "냥이", age: 3), Pet(type: "dog", name: "멍멍이", age: 1)]
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 4) {
                        Text("기록을 공유할 반려동물 선택하기")
                            .font(Font.system(size: 13, weight: .bold))
                            .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                            .frame(height: 20)
                        Image(petIsSelected ? "check_circle_brown" : "check_circle_gray")
                    }
                    // pet이 2마리 이상일 경우에만. 1마리면 X
                    Text("(중복 선택 가능)")
                        .font(Font.system(size: 12, weight: .medium))
                      .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63).opacity(0.9))
                      .frame(height: 20)
                    
                    // Pet List
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(petList.indices, id: \.self) { index in
                                VStack(spacing: 7) {
                                    Circle()
                                        .foregroundColor(.clear)
                                        .frame(width: 62, height: 62)
                                        .background(
                                            Image(petList[index].type == "dog" ? "dog_face" : "cat_face")
                                                .frame(width: 59, height: 59)
                                                .overlay(
                                                    Circle()
                                                        .stroke(petSelectionList[index] ? Color(red: 0.38, green: 0.28, blue: 0.14) : Color(red: 0.91, green: 0.91, blue: 0.91), lineWidth: 3)
                                                )
                                        )
                                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                        .clipShape(Circle())
                                
                                    VStack(spacing: -5) {
                                        Text(petList[index].name)
                                            .font(Font.system(size: 13, weight: .semibold))
                                            .frame(height: 20)
                                            .foregroundColor(.black)
                                        Text("\(petList[index].age)살")
                                            .font(Font.system(size: 10))
                                            .frame(height: 20)
                                            .foregroundColor(.black)
                                    }
                                }
                                .onTapGesture {
                                    if petSelectionList[index] {
                                        petSelectionList[index] = false
                                        if !petSelectionList.contains(true) {
                                            petIsSelected = false
                                        }
                                    } else {
                                        petSelectionList[index] = true
                                        petIsSelected = true
                                    }
                                }
                            }
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.top, 16)
                    
                    Text("제목")
                        .padding(.top, 23)
                }
                Spacer()
            }
            .padding(.top, 25)
            .padding(.leading, 16)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("arrow_left_black")
                }
            }
        }
        .navigationTitle("기록 공유")
        .navigationBarBackButtonHidden(true)
    }
}

struct AddRecordView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecordView()
    }
}
