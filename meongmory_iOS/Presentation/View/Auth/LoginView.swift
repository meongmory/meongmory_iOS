//
//  LoginView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/01.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient
                
                VStack {
                    mainIconStack
                    loginButton
                }
            }
        }
    }
    
    
    var backgroundGradient: some View {
        LinearGradient(
            colors: [
                Color(red: 255/255, green: 255/255, blue: 255/255),
                Color(red: 252/255, green: 247/255, blue: 236/255)
            ],
            startPoint: .top, endPoint: .bottom
        ).ignoresSafeArea()
    }
    
    
    var mainIconStack: some View {
        VStack {
            Image("main_icon")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(.bottom, 20)

            Image("main_text_icon")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(.bottom, 100)
        }
    }
    
    var loginButton: some View {
        NavigationLink {
            ValidatePhoneNumView()
        } label: {
            HStack {
                Image(systemName: "phone.fill")
                    .padding(.leading, 42)
                Text("휴대폰 번호로 시작하기")
                    .fontWeight(.bold)
                    .padding(.vertical, 15)
                    .padding(.trailing, 42)
                
            }.foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(25)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
