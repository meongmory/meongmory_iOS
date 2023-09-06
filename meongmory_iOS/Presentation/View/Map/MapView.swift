//
//  MapView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/07/31.
//

import SwiftUI
import KakaoMapsSDK

struct MapView: View {
    private let mapService = MapService()
    
    @State var coord: (Double, Double) = (126.74866529313351, 37.43121337890625)
    @State var draw: Bool = false
    
    
    var body: some View {
        ZStack() {
            KakaoMapView(draw: $draw, coord: $coord)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    draw = true
                    mapService.getAllLocation(x: coord.0.description, y: coord.1.description)
                }.onDisappear {
                    draw = false
                }

            VStack {
                MapTypeLazyGrid()
                    .padding(.vertical, 11)

                Spacer()

//                MapInfoView()
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 38)
            }
                
            
           
        }
    }
}

struct KakaoMapView: UIViewRepresentable {
    @Binding var draw: Bool
    @Binding var coord: (Double, Double)
    
    /// UIView를 상속한 KMViewContainer를 생성한다.
    /// 뷰 생성과 함께 KMControllerDelegate를 구현한 Coordinator를 생성하고, 엔진을 생성 및 초기화한다.
    func makeUIView(context: Self.Context) -> KMViewContainer {
        let view: KMViewContainer = KMViewContainer()
        view.sizeToFit()
        context.coordinator.createController(view)
        context.coordinator.controller?.initEngine()
        
        return view
    }

    
    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    /// draw가 true로 설정되면 엔진을 시작하고 렌더링을 시작한다.
    /// draw가 false로 설정되면 렌더링을 멈추고 엔진을 stop한다.
    func updateUIView(_ uiView: KMViewContainer, context: Self.Context) {
        if draw {
            context.coordinator.setCoord(coord: self.coord)
            context.coordinator.controller?.startEngine()
            context.coordinator.controller?.startRendering()
        }
        else {
            context.coordinator.controller?.stopRendering()
            context.coordinator.controller?.stopEngine()
        }
    }
    
    /// Coordinator 생성
    func makeCoordinator() -> KakaoMapCoordinator {
        let coordinator = KakaoMapCoordinator()
        coordinator.setCoord(coord: coord)
        return coordinator
    }

    /// Cleans up the presented `UIView` (and coordinator) in
    /// anticipation of their removal.
    static func dismantleUIView(_ uiView: KMViewContainer, coordinator: KakaoMapCoordinator) {
        
    }
    
    /// Coordinator 구현. KMControllerDelegate를 adopt한다.
    class KakaoMapCoordinator: NSObject, MapControllerDelegate {
        var coord: (Double, Double)?
        
        var controller: KMController?
        var first: Bool
        
        override init() {
            first = true
            super.init()
        }
        
        func setCoord(coord: (Double, Double)) {
            self.coord = coord
        }
        
        
         // KMController 객체 생성 및 event delegate 지정
        func createController(_ view: KMViewContainer) {
            controller = KMController(viewContainer: view)
            controller?.delegate = self
        }
        
         // KMControllerDelegate Protocol method구현
         
          /// 엔진 생성 및 초기화 이후, 렌더링 준비가 완료되면 아래 addViews를 호출한다.
          /// 원하는 뷰를 생성한다.
        func addViews() {
            print(12)
            let point = MapPoint(longitude: coord!.0, latitude: coord!.1)
                
            // MapviewInfo생성.
            // viewName과 사용할 viewInfoName, defaultPosition과 level을 설정한다.
            let mapviewInfo: MapviewInfo = MapviewInfo(viewName: "mapview", viewInfoName: "map", defaultPosition: point, defaultLevel: 3)
                
            // mapviewInfo를 파라미터로 mapController를 통해 생성한 뷰의 객체를 얻어온다.
            // 정상적으로 생성되는 경우 Result.OK, 생성에 실패하는경우 Result.NOK가 리턴된다.
            if controller?.addView(mapviewInfo) == Result.OK {
                print("OK")
            }
        }
        
        /// KMViewContainer 리사이징 될 때 호출.
        func containerDidResized(_ size: CGSize) {
            print(12)
            let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
            mapView?.viewRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
            if first {
                let cameraUpdate: CameraUpdate = CameraUpdate.make(target: MapPoint(longitude: coord!.0, latitude: coord!.1), zoomLevel: 10, mapView: mapView!)
                mapView?.moveCamera(cameraUpdate)
                first = false
            }
        }
        
        func authenticationSucceeded() {
           print("성공")
        }
        
        func authenticationFailed(_ errorCode: Int, desc: String) {
           print("error code: \(errorCode)")
           print("\(desc)")

           // 추가 실패 처리 작업
       }
        
    
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
