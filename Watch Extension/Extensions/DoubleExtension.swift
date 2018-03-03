//
//  DoubleExtension.swift
//  Watch Extension
//
//  Created by Alexander Khitev on 3/3/18.
//  Copyright © 2018 Alexander Khitev. All rights reserved.
//

import Foundation

extension Double {
    
    func degrees() -> Double {
        return 180 / .pi * self
    }
    
}
