//
//  TwoPageViewController.swift
//  TwoTabPage
//
//  Created by 吉川昂広 on 2019/03/28.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

protocol PageViewControllerNoticeable {
    func paging(_ transform: CGAffineTransform)
}

final class TwoPageViewController<L: UIViewController, R: UIViewController>: UIPageViewController, ControllerInjectable, UIPageViewControllerDataSource, UIScrollViewDelegate {

    struct Dependency {
        let leftViewController: L
        let rightViewController: R
    }
    
    var dependency: Dependency!
    var noticeable: PageViewControllerNoticeable?
    
    static func makeInstance(dependency: Dependency) -> TwoPageViewController {
        let viewController =
            TwoPageViewController.init(transitionStyle: .scroll,
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
        self.setViewControllers(
            [dependency.leftViewController],
            direction: .forward,
            animated: true,
            completion: nil)
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
    
    func setLeftViewController() {
        setViewControllers(
            [dependency.leftViewController],
            direction: .reverse,
            animated: true,
            completion: nil)
    }
    
    func setRightViewController() {
        setViewControllers(
            [dependency.rightViewController],
            direction: .forward,
            animated: true,
            completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll")
        let amountOfMovement = (UIScreen.main.bounds.width - scrollView.contentOffset.x) / 2
        guard amountOfMovement != 0 else { return }
        if amountOfMovement < 0 {
            //underLine.transform = CGAffineTransform(translationX: -amountOfMovement, y: 0)
            let transform = CGAffineTransform(translationX: -amountOfMovement, y: 0)
            noticeable?.paging(transform)
        } else {
            //underLine.transform =
            //    CGAffineTransform(translationX: (UIScreen.main.bounds.width / 2) - amountOfMovement, y: 0)
            let transform =
                CGAffineTransform(translationX: (UIScreen.main.bounds.width / 2) - amountOfMovement, y: 0)
            noticeable?.paging(transform)
        }
    }

}
