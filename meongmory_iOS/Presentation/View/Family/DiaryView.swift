//
//  DiaryView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI
import PagerTabStripView

enum Page: String {
    case gallery
    case list
}

struct DiaryView: View {
    @State var selection = Page.gallery
//    @StateObject var galleryModel = ListModel()
//    @StateObject var listModel = ListModel()
    
    var body: some View {
        PagerTabStripView(selection: $selection) {
            DiaryGalleryView()
                .pagerTabItem(tag: Page.gallery) {
                    DiaryTabBarItem(selectedImageName: "layout_black", defaultImageName: "layout_gray", selection: $selection, tag: Page.gallery)
                }
            DiaryListView()
                .pagerTabItem(tag: Page.list) {
                    DiaryTabBarItem(selectedImageName: "list_black", defaultImageName: "list_gray", selection: $selection, tag: Page.list)
                }
        }
        .pagerTabStripViewStyle(.barButton(placedInToolbar: false, tabItemHeight: 40, indicatorViewHeight: 0))
    }
}

struct DiaryTabBarItem<SelectionType>: View where SelectionType: Hashable {
    @EnvironmentObject private var pagerSettings: PagerSettings<SelectionType>
    
    @Binding var selection: SelectionType
    var selectedImageName: String
    var defaultImageName: String
    let tag: SelectionType
    
    init(selectedImageName: String, defaultImageName: String, selection: Binding<SelectionType>, tag: SelectionType) {
        self.tag = tag
        self.selectedImageName = selectedImageName
        self.defaultImageName = defaultImageName
        _selection = selection
    }
    
    var body: some View {
        VStack {
            Image(selection == tag ? selectedImageName : defaultImageName)
        }
        .animation(.easeInOut, value: selection)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
