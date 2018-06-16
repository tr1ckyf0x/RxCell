//
//  ExampleTableCellViewModel.swift
//  RxCell_Example
//
//  Created by Vladislav Lisyanskiy on 16.06.2018.


import Foundation
import RxSwift
import RxCocoa

class ExampleTableCellViewModel {
  
  let user: BehaviorRelay<User>
  let fullname: Driver<String>
  
  init(user: User) {
    self.user = BehaviorRelay(value: user)
    fullname = self.user.map { "\($0.firstname) \($0.lastname)" }.asDriver(onErrorJustReturn: "")
  }
}
