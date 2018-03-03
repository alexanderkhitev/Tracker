//
//  MotionManager.swift
//  Watch Extension
//
//  Created by Alexander Khitev on 3/3/18.
//  Copyright © 2018 Alexander Khitev. All rights reserved.
//

import Foundation
import CoreMotion
import CoreLocation
import WatchKit

class MotionManager {
    
    static let shared = MotionManager()
    private init() {
        setupSettings()
    }

    
    private let cmotionManager = CMMotionManager()
    
    open func launch() {
        startMotion()
    }
    
    // MARK: - Settings
    
    private func setupSettings() {
        cmotionManager.gyroUpdateInterval = 1
        cmotionManager.accelerometerUpdateInterval = 1
        cmotionManager.deviceMotionUpdateInterval = 30
    }
    
    // MARK: - Gyro
    
    // MARK: - All data
    
    private func startMotion() {
        cmotionManager.startDeviceMotionUpdates(to: .main) { (deviceMotion, error) in
            guard let _deviceMotion = deviceMotion else { return }
            let x = _deviceMotion.rotationRate.x.degrees()
            let y = _deviceMotion.rotationRate.y.degrees()
            let z = _deviceMotion.rotationRate.z.degrees()
            debugPrint(x, y, z)
        }
    }
    
    
}
