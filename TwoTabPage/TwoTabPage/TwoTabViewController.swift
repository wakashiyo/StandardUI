//
//  TwoTabViewController.swift
//  TwoTabPage
//
//  Created by 吉川昂広 on 2019/03/28.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

final class TwoTabViewController: UIViewController, ControllerInjectable, PageViewControllerNoticeable {

    @IBOutlet weak var underLine: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    struct Dependency {
        let pageViewController: TwoPageViewController<LeftViewController, RightViewController>
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
        
        addChild(dependency.pageViewController)
        dependency.pageViewController.view
            .translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dependency.pageViewController.view)
        
        dependency.pageViewController.view
            .leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            .isActive = true
        
        dependency.pageViewController.view
            .topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
            .isActive = true
        
        dependency.pageViewController.view
            .trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            .isActive = true
        
        dependency.pageViewController.view
            .bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
        
        didMove(toParent: self)
        
        dependency.pageViewController.noticeable = self
    }
    
    @objc func rightButtonTapped() {
        UIView.animate(withDuration: 0.3, animations: {
            self.underLine.transform =
                CGAffineTransform(translationX: self.view.frame.width / 2, y: 0)
        })
        dependency.pageViewController.setRightViewController()
    }
    
    @objc func leftButtonTapped() {
        UIView.animate(withDuration: 0.3, animations: {
            self.underLine.transform = CGAffineTransform.identity
        })
        dependency.pageViewController.setLeftViewController()
    }
    
    func paging(_ transform: CGAffineTransform) {
        underLine.transform = transform
    }

}
