//
//  TwoPageViewController.swift
//  TwoTabPage
//
//  Created by 吉川昂広 on 2019/03/28.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

final class TwoPageViewController<L: UIViewController, R: UIViewController>: UIPageViewController, ControllerInjectable, UIPageViewControllerDataSource, UIScrollViewDelegate {

    struct Dependency {
        let leftViewController: L
        let rightViewController: R
    }
    
    var dependency: Dependency!
    
    static func makeInstance(dependency: Dependency) -> TwoPageViewController {
        let viewController = TwoPageViewController.init(transitionStyle: .scroll,
                                                        navigationOrientation: .horizontal,
                                                        options: nil)
        viewController.dependency = dependency
        return viewController
    }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: style,
                   navigationOrientation: navigationOrientation,
                   options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([dependency.leftViewController], direction: .forward, animated: true, completion: nil)
        dataSource = self
        self.view.subviews
            .filter{ $0.isKind(of: UIScrollView.self) }
            .forEach{ ($0 as! UIScrollView).delegate = self }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: R.self) {
            return dependency.leftViewController
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: L.self) {
            return dependency.rightViewController
        } else {
            return nil
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        <#code#>
//    }

}
