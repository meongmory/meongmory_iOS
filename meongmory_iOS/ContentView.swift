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
                MyPageView()    // TODO: 지도 view로 변경
                    .onTapGesture { selection = 0 }
                    .tabItem {
                        (selection == 0) ? Image("map.fill") : Image("map")
                    }
                    .tag(0)
                
                MyPageView()    // TODO: 홈 view로 변경
                    .onTapGesture { selection = 1 }
                    .tabItem {
                        (selection == 1) ? Image("home.fill") : Image("home")
                    }
                    .tag(1)
                
                MyPageView()
                    .onTapGesture { selection = 2 }
                    .tabItem {
                        (selection == 2) ? Image("mypage.fill") : Image("mypage")
                    }
                    .tag(2)
            })
            .navigationBarTitle(selection == 2 ? "마이페이지" : "", displayMode: .inline)
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
