//
//  ContentView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/07/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        TabView {
            MyPageView()
        }.tabItem {
            Image("map")
        }
        
        TabView {
            MyPageView()
        }.tabItem {
            Image("home")
        }
        
        TabView {
            MyPageView()
        }.tabItem {
            Image("mapge")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
