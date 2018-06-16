//
//  NSObject+Swizzle.swift
//
//  Created by Vladislav Lisyanskiy on 14.06.2018.

import Foundation

internal var swizzeledClasses: [AnyClass] = []

internal extension NSObject {
  class func swizzleMethodForSelector(_ originalSelector: Selector, withMethodForSelector swizzledSelector: Selector) {
    guard !swizzeledClasses.contains(where: { $0 === self }) else { return }
    swizzeledClasses.append(self)
    
    guard
      let originalMethod = class_getInstanceMethod(self, originalSelector),
      let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
      else { return }
    
    let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    
    if didAddMethod {
      class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod)
    }
  }
}
