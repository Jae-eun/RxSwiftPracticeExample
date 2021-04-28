//
//  AppCoordinator.swift
//  RxSwiftPracticeExample
//
//  Created by 이재은 on 2021/04/13.
//

import UIKit

// 화면 간의 연결/전환 의존성 분리
final class AppCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    // 화면 전환
    func start() {
        // 뷰모델을 외부에서 주입
        let viewController = ViewController.instantiate(viewModel: RestaurantsListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
