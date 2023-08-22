//
//  ContentView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/07/13.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1;
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection, content: {
                MapView()
                    .onTapGesture { selection = 0 }
                    .tabItem {
                        (selection == 0) ? Image("map.fill") : Image("map")
                    }
                    .tag(0)
                
                HomeView()
                    .onTapGesture { selection = 1 }
                    .tabItem {
                        (selection == 1) ? Image("home.fill") : Image("home")
                    }
                    .toolbar {
                        if selection == 1 {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Image("animory_home_logo")
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    // TODO: 알림 화면으로 이동
                                }, label: {
                                    Image("bell")
                                })
                            }
                        }
                    }
                    .tag(1)
                
                MyPageView()
                    .onTapGesture { selection = 2 }
                    .tabItem {
                        (selection == 2) ? Image("mypage.fill") : Image("mypage")
                    }
                    .tag(2)
            })
            .onAppear { UITabBar.appearance().backgroundColor = .white }
            .navigationBarTitle(selection == 2 ? "마이페이지" : "", displayMode: .inline)
          
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
