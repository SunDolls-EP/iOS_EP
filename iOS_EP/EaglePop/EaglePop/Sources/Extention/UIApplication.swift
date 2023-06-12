//
//  UIApplication.swift
//  EaglePop
//
//  Created by 최시훈 on 2023/05/18.
//

import UIKit

extension UIApplication {
    class func topMostController() -> UIViewController? {
        var topController = UIApplication.shared.keyWindow?.rootViewController
        
        while let presentedViewController = topController?.presentedViewController {
            topController = presentedViewController
        }
        
        return topController
    }
}
