//
//  TestViewController.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by nick on 10/22/20.
//  Copyright © 2020 DayDreamClover. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TestViewController: UIViewController , StoryboardInitializable {
    
    @IBOutlet weak var myBnt: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    
    var viewModel: TestViewModelType!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        myBnt.rx.tap
          .map{(username: "", password: "")}
          .bind(to: viewModel.inputs.testTrigger)
          .disposed(by: disposeBag)
    }
}
