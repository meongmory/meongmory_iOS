//
//  MapView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/07/31.
//

import SwiftUI
import NMapsMap

struct MapView: View {
    @State var coord: (Double, Double) = (0, 0)
    let locationManger = LocationManager()
    
    var body: some View {
        ZStack {
            NaverMapView(coord: $coord)
            VStack {
                Button {
                    coord = locationManger.getCoordinate()
                } label: {
                    Text("현재위치로")
                }
                Spacer()
            }.foregroundColor(Color.black)
            
        }
    }
}

struct NaverMapView: UIViewRepresentable {
    @Binding var coord: (Double, Double)

    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.mapView.touchDelegate = context.coordinator
        view.showZoomControls = false
        view.showLocationButton = true
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        return view
    }

    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        let cameraMove = NMFCameraUpdate(scrollTo: NMGLatLng(lat: coord.0, lng: coord.1))
        cameraMove.animation = .fly
        cameraMove.animationDuration = 1
        uiView.mapView.moveCamera(cameraMove)
    }
    
    class Coordinator: NSObject, NMFMapViewTouchDelegate {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
