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
    
    
    private let manager = CLLocationManager()
    
    
    private func setupSettings() {
        manager.delegate = self
        manager.activityType = .other
        manager.allowsBackgroundLocationUpdates = true
    }
    
    open func start() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways:
            manager.startUpdatingLocation()
            manager.startMonitoringSignificantLocationChanges()
            manager.allowsBackgroundLocationUpdates = true
        case .authorizedWhenInUse:
            manager.requestAlwaysAuthorization()
            manager.startUpdatingLocation()
        case .restricted, .notDetermined:
            manager.requestAlwaysAuthorization()
        case .denied:
            break
        }
    }
    
}

// MARK: - CLLocationManager's delegate

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedAlways || status == .authorizedWhenInUse else { return }
        start()
    }
    
}

