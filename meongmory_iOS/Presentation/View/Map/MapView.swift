//
//  MapView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/07/31.
//

import SwiftUI
import NMapsMap

struct MapView: View {
    let locationManger = LocationManager()
    @State var coord: (Double, Double)
    
    
    init() {
        self.coord = locationManger.getCoordinate()
    }
    
    var body: some View {
        ZStack() {
            NaverMapView(coord: $coord)
                .ignoresSafeArea()
            
            VStack {
                MapTypeLazyGrid()
                    .padding(.vertical, 11)
                
                Spacer()
                
                MapInfoView()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 38)
            }
        }
    }
}

struct NaverMapView: UIViewRepresentable {
    @Binding var coord: (Double, Double)

    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.showLocationButton = true
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        let cameraMove = NMFCameraUpdate(scrollTo: NMGLatLng(lat: coord.0, lng: coord.1))
        cameraMove.animation = .fly
        cameraMove.animationDuration = 1
        view.mapView.moveCamera(cameraMove)
        
        return view
    }

    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
    }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
