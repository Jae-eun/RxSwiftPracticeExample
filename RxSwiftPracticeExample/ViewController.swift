//
//  ViewController.swift
//  RxSwiftPracticeExample
//
//  Created by 이재은 on 2021/04/13.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!

    private let disposeBag = DisposeBag()
    private var viewModel: RestaurantsListViewModel!

    /// Returns - ViewController
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Restaurant", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        navigationItem.title = viewModel.title

        viewModel.fetchRestaurantViewModels()
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }.disposed(by: disposeBag)
    }

    private func setUI() {
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
    }
}
