//
//  TwoTabPageMangerViewController.swift
//  TwoTabPage
//
//  Created by 吉川昂広 on 2019/03/28.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

final class TwoTabPageMangerViewController: UIViewController, ControllerInjectable {
    
    struct Dependency {
        let tabView: TwoTabViewController
    }
    
    private var dependency: Dependency!
    
    static func makeInstance(dependency: Dependency) -> TwoTabPageMangerViewController {
        let viewController = TwoTabPageMangerViewController()
        viewController.dependency = dependency
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChild(dependency.tabView)
        
        dependency.tabView.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dependency.tabView.view)
        
        dependency.tabView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dependency.tabView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dependency.tabView.view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dependency.tabView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        dependency.tabView.didMove(toParent: self)
    }
    
}
