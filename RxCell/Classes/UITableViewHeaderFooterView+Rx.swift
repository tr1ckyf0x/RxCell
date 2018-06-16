//
//  UITableViewHeaderFooterView+Rx.swift
//
//  Created by Vladislav Lisyanskiy on 14.06.2018.

import UIKit
import RxSwift

extension UITableViewHeaderFooterView: HasReusableDisposeBag {
  @objc func rx_prepareForReuse() {
    self.rx_prepareForReuse()
    rx.setReuseDisposeBag(DisposeBag())
  }
  
  internal final class func swizzle() {
    guard self === UITableViewHeaderFooterView.self else { return }
    self.swizzleMethodForSelector(#selector(self.prepareForReuse), withMethodForSelector: #selector(self.rx_prepareForReuse))
  }
}
