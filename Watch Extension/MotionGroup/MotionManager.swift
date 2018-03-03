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
        let updateInterval: Double = 10
        cmotionManager.gyroUpdateInterval = updateInterval
        cmotionManager.accelerometerUpdateInterval = updateInterval
        cmotionManager.deviceMotionUpdateInterval = updateInterval
    }
    
    // MARK: - Gyro
    
    // MARK: - All data
    
    private func startMotion() {
        cmotionManager.startDeviceMotionUpdates(to: .main) { (deviceMotion, error) in
            guard let _deviceMotion = deviceMotion else { return }
            let x = _deviceMotion.rotationRate.x.degrees()
            let y = _deviceMotion.rotationRate.y.degrees()
            let z = _deviceMotion.rotationRate.z.degrees()
            debugPrint("Motion", x, y, z)
        }
    }
    
    private func startAccelerometer() {
        cmotionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let _data = data else { return }
            debugPrint("startAccelerometer", _data.acceleration)
        }
    }
    
    private func startGyro() {
        cmotionManager.startGyroUpdates(to: .main) { (data, error) in
            guard let _data = data else { return }
            debugPrint("Gyro", _data)
        }
    }
    
}
