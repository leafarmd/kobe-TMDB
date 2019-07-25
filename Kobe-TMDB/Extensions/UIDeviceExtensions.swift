//
//  Global.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 25/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation
import UIKit

public extension UIDevice {
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    var screenType: ScreenType {
        guard iPhone else { return .unknown }
        let screenHeight = UIScreen.main.nativeBounds.height
        
        switch screenHeight {
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 1920, 2208:
            return .iPhone6Plus
        case 2436:
            return .iPhoneX
        case 2688:
            return .iPhoneXsMax
        default:
            return .unknown
        }
    }
}

public  enum ScreenType: String {
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPhoneX
    case iPhoneXsMax
    case unknown
}

public func screenSize<T: Any>(regular: T, reduced: T? = nil, extended: T? = nil, maximized: T? = nil) -> T {
    if let reduced = reduced, UIDevice.current.screenType == .iPhone5 {
        return reduced
    } else if let extended = extended, UIDevice.current.screenType == .iPhoneX, UIDevice.current.screenType == .iPhone6Plus {
        return extended
    } else if  let maximized = maximized, UIDevice.current.screenType == .iPhoneXsMax {
        return maximized
    }
    return regular
}
