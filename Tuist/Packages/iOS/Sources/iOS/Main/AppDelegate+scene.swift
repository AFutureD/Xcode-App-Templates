//
//  File.swift
//  
//
//  Created by 尼诺 on 2023/12/8.
//

import Foundation
import UIKit

extension UISceneConfiguration {
    public static let defaultScene: UISceneConfiguration = {
        let scene = UISceneConfiguration.init(name: "Default Scene Configuration", sessionRole: .windowApplication)
        scene.delegateClass = SceneDelegate.self
        return scene
    }()
}
