//
//  ExampleTableViewCell.swift
//  RxCell_Example
//
//  Created by Vladislav Lisyanskiy on 16.06.2018.


import UIKit
import RxSwift
import RxCocoa
import RxCell

class ExampleTableViewCell: UITableViewCell {

  @IBOutlet weak var myLabel: UILabel!
  var viewModel: ExampleTableCellViewModel? = nil {
    didSet {
      viewModel?.fullname
        .do(onDispose: { print("\u{1F5D1} Cell label subscription disposed.") })
        .drive(myLabel.rx.text)
        .disposed(by: rx.reuseDisposeBag)
    }
  }
    
}
