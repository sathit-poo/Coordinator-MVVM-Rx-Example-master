//
//  TestViewModel.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by nick on 10/22/20.
//  Copyright © 2020 DayDreamClover. All rights reserved.
//

import RxSwift
import RxCocoa

protocol TestViewModelInputs {
  var testTrigger: PublishSubject<(username: String, password: String)> { get }
}

protocol TestViewModelOutputs {
    
}

protocol TestViewModelCoordinates {
  var navigateToMain: PublishSubject<String> { get }
}

protocol TestViewModelType {
  var inputs: TestViewModelInputs { get }
  var outputs: TestViewModelOutputs { get }
  var coordinates: TestViewModelCoordinates { get }
}

class TestViewModel: TestViewModelType, TestViewModelInputs, TestViewModelOutputs, TestViewModelCoordinates {
  
  func navigateBack() {
    
  }
  
  
  // MARK: Property
  
  let disposeBag = DisposeBag()
  
  // MARK: Init
    
  public init() {
    
  inputs.testTrigger
      .map{ _ in return "hyuhbuknbknjk" }
      .bind(to:  coordinates.navigateToMain)
      .disposed(by: disposeBag)
  }
  
  // MARK: Private
  
  // MARK: Input
  
  let testTrigger = PublishSubject<(username: String, password: String)>()
  
  // MARK: Output
  
  // MARK: Coordinates
  
  let navigateToMain = PublishSubject<String>()
  
  // MARK: Input&Output&Coordinates
    
  public var outputs: TestViewModelOutputs { return self }
  public var inputs: TestViewModelInputs { return self }
  internal var coordinates: TestViewModelCoordinates { return self }
}
