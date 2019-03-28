//
//  TwoPageViewController.swift
//  TwoTabPage
//
//  Created by 吉川昂広 on 2019/03/28.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

final class TwoPageViewController: UIPageViewController, ControllerInjectable {

    struct Dependency {
        let leftViewController: UIViewController
        let rightViewController: UIViewController
    }
    
    private var dependency: Dependency!
    
    static func makeInstance(dependency: Dependency) -> TwoPageViewController {
        let viewController = TwoPageViewController()
        viewController.dependency = dependency
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers([dependency.leftViewController], direction: .forward, animated: true, completion: nil)
    }

}

extension TwoPageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: UIViewController.self) {
            return dependency.leftViewController
        } else {
            return nil
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: UIViewController.self) {
            return dependency.rightViewController
        } else {
            return nil
        }
    }

}

//
//extension TwoPageViewController: UIPageViewControllerDelegate {
//
//    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//        <#code#>
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        <#code#>
//    }
//}
