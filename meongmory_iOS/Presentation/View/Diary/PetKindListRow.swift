//
//  PetKindListRow.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/13.
//

import SwiftUI

struct Animal: Identifiable {
    var id: Int
    var animalName: String
    var animalType: String
}

struct PetKindListRow: View {
    @State var animal: Animal
    @Binding var selectedId: Int
    
    var body: some View {
        HStack {
            Image(animal.animalType == "강아지" ? (selectedId == animal.id ? "animal_dog_select" : "animal_dog") : (selectedId == animal.id ? "animal_cat_select": "animal_cat"))
            
            Text(animal.animalName + " [\(animal.animalType)]")
              .font(Font.custom("AppleSDGothicNeoM00", size: 12))
              .foregroundColor(.black)
            
            Spacer()
            
            Image(selectedId == animal.id ? "animal_checkbox_select" : "animal_checkbox")
        }.onTapGesture {
            selectedId = animal.id
        }
    }
}

struct PetKindListRow_Previews: PreviewProvider {
    static var previews: some View {
        PetKindListRow(animal: Animal(id: 1, animalName: "말티즈", animalType: "강아지"), selectedId: .constant(-1))
    }
}
