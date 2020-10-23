//
//  TestCoordinator.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by nick on 10/22/20.
//  Copyright © 2020 DayDreamClover. All rights reserved.
//

import UIKit
import RxSwift

class TestCoordinator: BaseCoordinator<Void> {
  
  override func start() -> Observable<Void> {
    let viewModel = TestViewModel()
    let viewController = TestViewController.initFromStoryboard(name: Storyboard.main.identifier)
    let navigationController = UINavigationController(rootViewController: viewController)
    
    viewController.viewModel = viewModel
    
    viewModel.coordinates.navigateToMain
      .flatMapLatest { [weak self] token -> Observable<Void> in
        guard let `self` = self else { return Observable.just(()) }
        return self.navigateToMain(window: self.window, baseViewController: viewController, token: token)
      }
      .subscribe()
      .disposed(by: disposeBag)
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    
    return .never()
  }
  
  private func navigateToMain(window: UIWindow, baseViewController: UIViewController, token: String) -> Observable<Void> {
    let mainCoordinator = MainCoordinator(window: window, baseViewController: baseViewController)
    mainCoordinator.inputParams.token = token
    return coordinate(to: mainCoordinator)
  }
}
