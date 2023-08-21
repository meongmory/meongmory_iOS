//
//  FamilyIntroView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/21.
//

import SwiftUI

struct FamilyIntroView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private var familyName: String = "유상이네"
    private var petList: [String] = ["루비", "밍키", "아주아주 귀여운 강아지 옥수수", "밍키", "보고싶은 옥수수", "메롱"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(.black.opacity(0.4))
                .background(
                    Image("pet_example")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                )
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                Text("유상이네")
                    .font(Font.system(size: 28, weight: .bold))
                    .kerning(1)
                    .foregroundColor(.white)
                VStack(spacing: 20) {
                    // 최대 5마리까지만 이름이 보임. 그 이상은 줄임표
                    ForEach(petList.indices, id:\.self) { index in
                        if index < 5 {
                            Text(petList[index])
                        } else if index == 5 {
                            Text("...")
                        }
                    }
                    .font(Font.system(size: 20, weight: .medium))
                    .kerning(1)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                }
                Spacer()
                
                NavigationLink {
                    FamilyMainView()
                } label: {
                    Image("chevron_down_white")
                }
            }
            .padding(.top, 120)
            .padding(.horizontal, 24)
            .padding(.bottom, 31)
        }
        .edgesIgnoringSafeArea(.bottom)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("arrow_left")
                }
            }
        }
        .toolbarBackground(.clear, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }
}

struct FamilyIntroView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyIntroView()
    }
}
