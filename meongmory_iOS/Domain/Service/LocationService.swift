//
//  MapViewModel.swift
//  meongmory_iOS
//
//  Created by 유상 on 2023/08/01.
//

import Foundation
import CoreLocation
import Combine


class LocationManager: NSObject, CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }


    func getCoordinate()  -> (Double, Double) {
        locationManager.startUpdatingLocation()
        
        if let coordinate = locationManager.location?.coordinate {
            print(coordinate)
            return (coordinate.longitude, coordinate.latitude)
        }
        return (0, 0)
    }
}
