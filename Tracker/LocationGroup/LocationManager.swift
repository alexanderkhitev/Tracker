//
//  LocationManager.swift
//  Tracker
//
//  Created by Alexander Khitev on 3/3/18.
//  Copyright © 2018 Alexander Khitev. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    private override init() {
        super.init()
        setupSettings()
    }
    
    static let shared = LocationManager()
    
    
    private let cllocationManager = CLLocationManager()
    
    
    private func setupSettings() {
        cllocationManager.delegate = self
        cllocationManager.activityType = .other
        cllocationManager.allowsBackgroundLocationUpdates = true
        cllocationManager.requestAlwaysAuthorization()
    }
    
    open func start() {
        cllocationManager.startUpdatingLocation()
    }
    
}

// MARK: - CLLocationManager's delegate

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let last = locations.last else { return }
        debugPrint("last", last.course)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedAlways || status == .authorizedWhenInUse else { return }
        start()
    }
    
}

