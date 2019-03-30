//
//  TwoTabViewController.swift
//  TwoTabPage
//
//  Created by 吉川昂広 on 2019/03/28.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

final class TwoTabViewController: UIViewController, ControllerInjectable {

    @IBOutlet weak var underLine: UIView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    struct Dependency {
        let pageViewController: TwoPageViewController<RightViewController, LeftViewController>
    }
    
    private var dependency: Dependency!
    
    static func makeInstance(dependency: Dependency) -> TwoTabViewController {
        let viewController = TwoTabViewController()
        viewController.dependency = dependency
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
    }
    
    @objc func rightButtonTapped() {}
    
    @objc func leftButtonTapped() {}
    
    

}
