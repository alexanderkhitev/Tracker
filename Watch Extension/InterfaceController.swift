//
//  InterfaceController.swift
//  Watch Extension
//
//  Created by Alexander Khitev on 3/3/18.
//  Copyright © 2018 Alexander Khitev. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        MotionManager.shared.launch()
        debugPrint("InterfaceController awake")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
