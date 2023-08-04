//
//  OnBoardingView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/04.
//

import SwiftUI

struct OnBoardingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            bottomButton
        }
        .padding(.top, 40)
        .padding(.horizontal, 20)

        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                }
            }
        }
    }
    
    var bottomButton: some View {
        NavigationLink {
            OnBoardingView()
        } label: {
            Text("다음")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(red: 60/255, green: 39/255, blue: 10/255))
        .cornerRadius(10)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
