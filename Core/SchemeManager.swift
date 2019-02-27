//
//  SchemeManager.swift
//  AppColors-iOS
//
//  Created by Andrey Tchernov on 27.02.2019.
//  Copyright © 2019 IceRock Development. All rights reserved.
//

import UIKit

//MARK: Scheme manager
class SchemeManager: NSObject {
  
  enum ResourceType { //Type of supported scheme values
    case color(UIColor)
  }
  
  typealias Scheme = [String: ResourceType] //Type for current scheme storage
  
  private (set) var currentScheme = Scheme()
  private var needAppearanceUpdate = false
    
  func update(withScheme scheme: Scheme) {  //Update only with method (for subscribes update later)
    currentScheme = scheme
  }
}

//MARK: - Extension methods for resource types
extension Dictionary where Key == SchemeManager.Scheme.Key, Value == SchemeManager.Scheme.Value {
  func color(byKey key: Key) -> UIColor? {
    guard let value = self[key] else {
      return nil
    }
    switch value {
      case .color(let color): return color
    }
  }
}

//TODO: Append fonts, sizes, etc..
