//
//  ViewControllerViewModel.swift
//  RxCell_Example
//
//  Created by Vladislav Lisyanskiy on 16.06.2018.


import Foundation
import RxSwift
import RxCocoa

class ViewControllerViewModel {
  private let users: BehaviorRelay<[User]>
  let userViewModels: Driver<[ExampleTableCellViewModel]>
  
  init() {
    users = BehaviorRelay(value: [User(firstname: "Vladislav", lastname: "Lisyanskiy"), User(firstname: "Steve", lastname: "Jobs"), User(firstname: "Albert", lastname: "Einstein"), User(firstname: "Vladimir", lastname: "Putin"), User(firstname: "Donald", lastname: "Trump"), User(firstname: "Elvis", lastname: "Presley"), User(firstname: "John", lastname: "Lennon"), User(firstname: "Kurt", lastname: "Cobain"), User(firstname: "Bob", lastname: "Dylan"), User(firstname: "Bill", lastname: "Gates"), User(firstname: "Russell", lastname: "Crowe"), User(firstname: "Bruce", lastname: "Robertson"), User(firstname: "Johny", lastname: "Depp"), User(firstname: "Tom", lastname: "Hanks"), User(firstname: "Anthony", lastname: "Hopkins"), User(firstname: "Robin", lastname: "Williams")])
    userViewModels = users.asDriver(onErrorJustReturn: [])
      .map { users in
        users.map { ExampleTableCellViewModel(user: $0) }
    }
  }
}
