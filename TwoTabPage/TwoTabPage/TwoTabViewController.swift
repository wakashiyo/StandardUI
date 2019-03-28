//
//  TwoTabViewController.swift
//  TwoTabPage
//
//  Created by 吉川昂広 on 2019/03/28.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

class TwoTabViewController: UIViewController {

    @IBOutlet weak var underLine: UIView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    var delegate: TabNoticeable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
    }
    
    @objc func rightButtonTapped() {
        transformUnderLineToLeft()
    }
    
    @objc func leftButtonTapped() {
        transformUnderLineToRight()
    }
    
    // direction:   left => right
    // action:      button Tap
    func transformUnderLineToRight() {
        UIView.animate(withDuration: 0.3, animations: {
            self.underLine.transform = CGAffineTransform(translationX: self.view.frame.width / 2, y: 0)
        })
    }
    
    // direction:   right => left
    // action:      button Tap
    func transformUnderLineToLeft() {
        UIView.animate(withDuration: 0.3, animations: {
            self.underLine.transform = CGAffineTransform.identity
        })
    }
    
    // direction:   left => right
    // action:      page scroll
    func transformUnderLineToRightByPageScroll(_ val: CGFloat) {
        underLine.transform = CGAffineTransform(translationX: -val, y: 0)
    }
    
    // direction:   right => left
    // action:      page scroll
    func transformUnderLineToLeftByPageScroll(_ val: CGFloat) {
        underLine.transform = CGAffineTransform(translationX: (UIScreen.main.bounds.width / 2) - val, y: 0)
    }

}
