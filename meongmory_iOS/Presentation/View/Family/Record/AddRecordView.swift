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

enum RecordSharingScope: Int, CaseIterable {
    case all
    case onlyFamily
    case none
}

struct AddRecordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var isProVersion = false
    @State private var petIsSelected = false
    @State private var titleIsWritten = false
    @State private var imageIsAdded = false
    @State private var contentIsWritten = false
    @State private var sharingScopeIsSelected = false
    @State private var AllDone = false
    // 서버 연동할 때 petList.count만큼 동적으로 init하는 걸로 바꾸기
    @State private var petSelectionList: [Bool] = [false, false, false, false, false]
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var selectedShareScope: RecordSharingScope = .none
    // 더미데이터
    private var petList: [Pet] = [Pet(type: "dog", name: "루비", age: 14), Pet(type: "dog", name: "밍키", age: 10), Pet(type: "dog", name: "옥수수", age: 8), Pet(type: "cat", name: "냥이", age: 3), Pet(type: "dog", name: "멍멍이", age: 1)]
    @State private var imageList: [Image] = []
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    Group {
                        HStack(spacing: 4) {
                            Text("기록을 공유할 반려동물 선택하기")
                                .font(Font.system(size: 13, weight: .bold))
                                .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                                .frame(height: 20)
                            Image(petIsSelected ? "check_circle_brown" : "check_circle_gray")
                        }
                        
                        if petList.count > 1 {
                            Text("(중복 선택 가능)")
                                .font(Font.system(size: 12, weight: .medium))
                                .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63).opacity(0.9))
                                .frame(height: 20)
                        }
                        
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
                    }
                    
                    Group {
                        HStack(spacing: 4) {
                            Text("제목")
                                .font(Font.system(size: 13, weight: .bold))
                                .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                                .frame(height: 20)
                            Image(titleIsWritten ? "check_circle_brown" : "check_circle_gray")
                        }
                        .padding(.top, 23)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: 40)
                                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: 0.5)
                                        .stroke(titleIsWritten ? Color(red: 0.75, green: 0.72, blue: 0.68) : Color(red: 0.91, green: 0.91, blue: 0.91), lineWidth: 1)
                                )
                            TextField("", text: $title, prompt: Text("제목을 입력해주세요").foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45)))
                                .font(Font.system(size: 12))
                                .foregroundColor(Color.black)
                                .disableAutocorrection(true)
                                .frame(height: 20)
                                .padding(.horizontal, 11)
                                .submitLabel(.done)
                                .onChange(of: title) { _ in
                                    if title.isEmpty {
                                        titleIsWritten = false
                                    } else {
                                        titleIsWritten = true
                                    }
                                }
                        }
                        .padding(.top, 12)
                        .padding(.trailing, 16)
                    }
                    
                    Group {
                        HStack(spacing: 4) {
                            Text("반려동물 사진 추가하기")
                                .font(Font.system(size: 13, weight: .bold))
                                .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                                .frame(height: 20)
                            Image(imageIsAdded ? "check_circle_brown" : "check_circle_gray")
                        }
                        .padding(.top, 23)
                        .padding(.bottom, 12)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 11) {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 105, height: 105)
                                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .inset(by: 1)
                                                .stroke(Color(red: 0.91, green: 0.91, blue: 0.91), lineWidth: 2)
                                        )
                                    VStack(spacing: 6) {
                                        Image("big_plus_gray")
                                        Text("사진/동영상 추가")
                                            .font(Font.system(size: 11, weight: .bold))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                                            .frame(height: 20)
                                    }
                                    .padding(.top, 29)
                                    .padding(.bottom, 18)
                                }
                                .onTapGesture {
                                    // TODO: 앨범으로 이동
                                }
                                
                                // Photo&Video List
                                LazyHStack(spacing: 11) {
                                    ForEach(imageList.indices, id: \.self) { index in
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .background(
                                                // 앨범에서 갖고올 때 어떻게 갖고 오는지 확인
//                                                Image(imageList[index])
//                                                    .resizable()
//                                                    .aspectRatio(contentMode: .fill)
//                                                    .frame(width: 105, height: 105)
//                                                    .clipped()
                                            )
                                            .frame(width: 105, height: 105)
                                            .cornerRadius(10)
                                    }
                                }
                                .padding(.trailing, 16)
                            }
                        }
                    }
                    
                    Group {
                        HStack(spacing: 4) {
                            Text("반려동물과의 추억 기록하기")
                                .font(Font.system(size: 13, weight: .bold))
                                .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                                .frame(height: 20)
                            Image(contentIsWritten ? "check_circle_brown" : "check_circle_gray")
                        }
                        .padding(.top, 23)
                        .padding(.bottom, 12)
                        
                        ZStack(alignment: .top) {
                            Rectangle()
                                .foregroundColor(.clear)
                                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: 0.5)
                                        .stroke(contentIsWritten ? Color(red: 0.75, green: 0.72, blue: 0.68) : Color(red: 0.91, green: 0.91, blue: 0.91), lineWidth: 1)
                                )
                            
                            TextField("", text: $content, prompt: Text("반려동물과의 즐거웠던 순간을 기록해주세요!").foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45)), axis: .vertical)
                                .font(Font.system(size: 12))
                                .foregroundColor(Color.black)
                                .disableAutocorrection(true)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 11)
                                .onChange(of: content) { _ in
                                    if content.isEmpty {
                                        contentIsWritten = false
                                    } else {
                                        contentIsWritten = true
                                    }
                                }
                        }
                        .frame(minHeight: 141, maxHeight: 300)
                        .padding(.trailing, 16)
                    }
                    
                    Group {
                        HStack(spacing: 4) {
                            Text("공유 범위 설정")
                                .font(Font.system(size: 13, weight: .bold))
                                .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                                .frame(height: 20)
                            Image(sharingScopeIsSelected ? "check_circle_brown" : "check_circle_gray")
                        }
                        .padding(.top, 23)
                        .padding(.bottom, 12)
                        
                        HStack(spacing: 16) {
                            HStack(spacing: 6) {
                                Image(selectedShareScope == RecordSharingScope.all ? "check_box_brown" : "check_box_gray")
                                    .onTapGesture {
                                        if selectedShareScope == RecordSharingScope.all {
                                            selectedShareScope = RecordSharingScope.none
                                            sharingScopeIsSelected = false
                                        } else {
                                            selectedShareScope = RecordSharingScope.all
                                            sharingScopeIsSelected = true
                                        }
                                    }
                                Text("전체 공유")
                                    .font(Font.system(size: 13, weight: .semibold))
                                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                            }
                            .frame(height: 20)
                            
                            HStack(spacing: 6) {
                                Image(selectedShareScope == RecordSharingScope.onlyFamily ? "check_box_brown" : "check_box_light_gray")
                                    .onTapGesture {
                                        if isProVersion {
                                            if selectedShareScope == RecordSharingScope.onlyFamily {
                                                selectedShareScope = RecordSharingScope.none
                                                sharingScopeIsSelected = false
                                            } else {
                                                selectedShareScope = RecordSharingScope.onlyFamily
                                                sharingScopeIsSelected = true
                                            }
                                        }
                                    }
                                Text("가족에게만 공유")
                                    .font(Font.system(size: 13, weight: .semibold))
                                    .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
                                if !isProVersion {
                                    Text("Pro 버전 결제 시 가능")
                                        .font(Font.system(size: 10))
                                        .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
                                }
                            }
                            .frame(height: 20)
                        }
                    }
                }
                .padding(.bottom, 90)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AddRecordView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecordView()
    }
}
