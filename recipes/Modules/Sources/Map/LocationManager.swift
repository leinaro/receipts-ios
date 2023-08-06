//
//  File.swift
//  
//
//  Created by Inés Rojas on 6/08/23.
//

import Foundation
import Combine
import CoreLocation

public class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
     @Published var location: CLLocation? {
       willSet { objectWillChange.send() }
     }
    
    var latitude: CLLocationDegrees {
        return location?.coordinate.latitude ?? 0
    }
    
    var longitude: CLLocationDegrees {
        return location?.coordinate.longitude ?? 0
    }
    
    public override init() {
      super.init()

      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}
