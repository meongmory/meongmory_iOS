//
//  PetKindView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/13.
//

import SwiftUI

struct PetKindView: View {
    @State var petKindSelect: String = ""
    @State var petKind: String = ""
    
    @State var petList: [Animal] = [
        Animal(id: 1, animalName: "말티즈", animalType: "강아지"),
        Animal(id: 2, animalName: "오드아이", animalType: "고양이")
    ]
    @State var selectedId: Int = -1
    
    
    
    
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                Button {
                    petKindSelect = "강아지"
                } label: {
                    Text("강아지")
                        .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(petKindSelect == "강아지" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))

                }.frame(width: (CGFloat.screenWidth - 47) / 2, height: 39)
                    .background(petKindSelect == "강아지" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(10)
                
                Button {
                    petKindSelect = "고양이"
                } label: {
                    Text("고양이")
                        .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(petKindSelect == "고양이" ? .black : Color(red: 0.45, green: 0.45, blue: 0.45))
                    
                }.frame(width: (CGFloat.screenWidth - 47) / 2, height: 39)
                    .background(petKindSelect == "고양이" ? Color(red: 1, green: 0.98, blue: 0.93) : Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(10)
                
            } // 강이지 고양이 선택 버튼
            
            ZStack(alignment: .trailing) {
                TextField("품종 검색", text: $petKind)
                    .foregroundColor(.clear)
                    .frame(width: (CGFloat.screenWidth - 32), height: 39)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(10)
                
                Image("search")
                    .padding(.trailing, 10)
            }
            
            List(petList) { pet in
                PetKindListRow(animal: pet, selectedId: $selectedId)
            }
        }
    }
}

struct PetKindView_Previews: PreviewProvider {
    static var previews: some View {
        PetKindView()
    }
}
