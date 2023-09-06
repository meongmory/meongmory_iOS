//
//  MapView.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/07/31.
//

import SwiftUI
import KakaoMapsSDK

struct MapView: View {
    
    @ObservedObject var viewModel: MapViewModel
    
    @State var coord: (Double, Double) = (126.74866529313351, 37.43121337890625)
    @State var draw: Bool = false
    
    
    var body: some View {
        ZStack() {
            KakaoMapView(draw: $draw, coord: $coord, allLocation: $viewModel.allLocation)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    draw = true
                    viewModel.loadLocation(x: coord.0.description, y: coord.1.description)
                }.onDisappear {
                    draw = false
                }

            VStack {
                MapTypeLazyGrid()
                    .padding(.vertical, 11)

                Spacer()
                
                Text(viewModel.allLocation.count.description)

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
    @Binding var allLocation: [Document]
    
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
                
                createLabelLayer()
                createPoiStyle()
                createPois()
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
        
        
        func createLabelLayer() {
            let view = controller?.getView("mapview") as! KakaoMap
            let manager = view.getLabelManager()    //LabelManager를 가져온다. LabelLayer는 LabelManger를 통해 추가할 수 있다.
            
            // 추가할 레이어의 옵션을 지정한다. 옵션에는 레이어에 속할 Label(POI)들의 경쟁방식, 레이어의 zOrder등의 속성을 지정할 수 있다.
            // 경쟁의 의미는 라벨이 표출되어야 하는 영역을 두고 다른 라벨과 경쟁을 함을 의미하고, 경쟁이 발생하게 되면 경쟁에서 이긴 라벨만 그려지게 된다.
            // competitionType : 경쟁의 대상을 지정한다.
            //                   예를 들어, none 으로 지정하게 되면 아무런 라벨과도 경쟁하지 않고 항상 그려지게 된다.
            //                   Upper가 있는 경우, 자신의 상위 레이어의 라벨과 경쟁이 발생한다. Lower가 있는 경우, 자신의 하위 레이어의 라벨과 경쟁한다. Same이 있는 경우, 자신과 같은 레이어에 속한 라벨과도 경쟁한다.
            //                   경쟁은 레이어의 zOrder순(오름차순)으로 진행되며, 레이어에 속한 라벨의 rank순(오름차순)으로 배치 및 경쟁을 진행한다.
            //                   경쟁은 레이어 내의 라벨(자신의 competitionType에 Same이 있는 경우)과 competitionType에 Lower가 있는 경우 자신의 하위 레이어(cocompetitionType에 Upper가 있는 레이어)를 대상으로 진행된다.
            //                   경쟁이 발생하면, 상위 레이어에 속한 라벨이 하위 레이어에 속한 라벨을 이기게 되고, 같은 레이어에 속한 라벨인 경우 rank값이 큰 라벨이 이기게 된다.
            // competitionUnit : 경쟁을 할 때의 영역을 처리하는 단위를 지정한다. .poi의 경우 심볼 및 텍스트 영역 모두가 경쟁영역이 되고, symbolFirst 인 경우 symbol 영역으로 경쟁을 처리하고 텍스트는 그려질 수 있는 경우에 한해 그려진다.
            // zOrder : 레이어의 우선 순위를 결정하는 order 값. 값이 클수록 우선순위가 높다.
            let layerOption = LabelLayerOptions(layerID: "PoiLayer", competitionType: .none, competitionUnit: .poi, orderType: .rank, zOrder: 10001)
            let _ = manager.addLabelLayer(option: layerOption)
        }
        
        // POI의 스타일을 생성한다.
        // PoiStyle은 한 개 이상의 레벨별 스타일(PerLevelPoiStyle)로 구성된다.
        // 각 레벨별 스타일을 통해 POI가 어떤 레벨에서 어떻게 그려질 것인지를 지정한다.
        // POI는 스타일이 지정되지 않거나, 지정되었어도 레벨별 스타일이 지정되지 않은 레벨에서는 그려지지 않는다.
        // 레벨별 스타일은 지정된 레벨에서부터 다른 레벨별 스타일이 지정된 레벨까지 적용된다.
        // 예를 들어, style1 을 7레벨, style2를 15 레벨로 지정하면 해당 스타일을 사용하는 POI는 0~6레벨까지는 그려지지 않고 7~14레벨까지는 style1으로 그려지고 14~21레벨까지는 style2로 그려진다.
        func createPoiStyle() {
            let view = controller?.getView("mapview") as! KakaoMap
            let manager = view.getLabelManager()
            // 심볼을 지정.
            // 심볼의 anchor point(심볼이 배치될때의 위치 기준점)를 지정. 심볼의 좌상단을 기준으로 한 % 값.
            let iconStyle = PoiIconStyle(symbol: UIImage(named: "hair_pin"), anchorPoint: CGPoint(x: 0.0, y: 0.5))
            let perLevelStyle = PerLevelPoiStyle(iconStyle: iconStyle, level: 0)  // 이 스타일이 적용되기 시작할 레벨.
            let poiStyle = PoiStyle(styleID: "customStyle1", styles: [perLevelStyle])
            manager.addPoiStyle(poiStyle)
        }
        
        // POI를 생성한다.
        func createPois() {
            let view = controller?.getView("mapview") as! KakaoMap
            let manager = view.getLabelManager()
            let layer = manager.getLabelLayer(layerID: "PoiLayer")   // 생성한 POI를 추가할 레이어를 가져온다.
            let poiOption = PoiOptions(styleID: "customStyle1") // 생성할 POI의 Option을 지정하기 위한 자료를 담는 클래스를 생성. 사용할 스타일의 ID를 지정한다.
            poiOption.rank = 0
            poiOption.clickable = true // clickable 옵션을 true로 설정한다. default는 false로 설정되어있다.
            
            let poi1 = layer?.addPoi(option: poiOption, at: MapPoint(longitude: coord!.0, latitude: coord!.1), callback: {(_ poi: (Poi?)) -> Void in
                print("")
            }
            )   //레이어에 지정한 옵션 및 위치로 POI를 추가한다.
            poi1?.show()
        }
        
        func poiTappedHandler(_ param: PoiInteractionEventParam) {
            param.poiItem.hide()
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
        MapView(viewModel: MapViewModel())
    }
}
