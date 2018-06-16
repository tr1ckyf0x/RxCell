//
//  Cell+Rx.swift
//
//  Created by Vladislav Lisyanskiy on 14.06.2018.

import Foundation
import UIKit
import RxSwift

public class RxCell {
  public static func activate() {
    UITableViewCell.swizzle()
    UICollectionReusableView.swizzle()
    UITableViewHeaderFooterView.swizzle()
  }
}

public protocol HasReusableDisposeBag: class {}

private struct AssociatedKeys {
  static var reusableDisposeBag = "rx.reusableDisposeBag"
}

private func lockWith(_ object: AnyObject, closure: () -> Void) {
  objc_sync_enter(object); defer { objc_sync_exit(object) }
  closure()
}

extension Reactive where Base: HasReusableDisposeBag {
  public func setReuseDisposeBag(_ disposeBag: DisposeBag) {
    lockWith(self.base) {
      objc_setAssociatedObject(self.base, &AssociatedKeys.reusableDisposeBag, disposeBag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  public var reuseDisposeBag: DisposeBag {
    get {
      var reusableDisposeBag: DisposeBag!
      lockWith(self.base) {
        if let disposeObject = objc_getAssociatedObject(self.base, &AssociatedKeys.reusableDisposeBag) as? DisposeBag { reusableDisposeBag = disposeObject; return }
        let disposeObject = DisposeBag()
        objc_setAssociatedObject(self.base, &AssociatedKeys.reusableDisposeBag, disposeObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        reusableDisposeBag = disposeObject
      }
      return reusableDisposeBag
    }
    set {
      lockWith(self.base) {
        objc_setAssociatedObject(self.base, &AssociatedKeys.reusableDisposeBag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
    }
  }
}
