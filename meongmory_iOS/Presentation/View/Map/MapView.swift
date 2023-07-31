//
//  MapView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/07/31.
//

import Foundation
import SwiftUI
import NMapsMap
import CoreLocation

struct MapView: View {
    var body: some View {
        ZStack {
            NaverMapView()
                .ignoresSafeArea()
        }
    }
}

struct NaverMapView: UIViewRepresentable {

    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.showLocationButton = true
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17

        return view
    }

    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
