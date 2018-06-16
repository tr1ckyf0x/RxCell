//
//  ViewController.swift
//  RxCell
//
//  Created by Vladislav Lisyanskiy on 16.06.2018.


import UIKit
import RxCell
import RxSwift
import RxCocoa
import NSObject_Rx
import RxDataSources

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  let viewModel = ViewControllerViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let nib = UINib(nibName: "ExampleTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "ExampleTableViewCell")
    viewModel.userViewModels.drive(tableView.rx.items(cellIdentifier: "ExampleTableViewCell", cellType: ExampleTableViewCell.self)) { index, viewModel, cell in
      cell.viewModel = viewModel
      }
      .disposed(by: rx.disposeBag)
  }
  
}

