//
//  Extensions.swift
//  CardUI
//
//  Created by 吉川昂広 on 2019/03/22.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import Foundation
import UIKit

//
extension NSObject {
    class var className: String{
        return String(describing: self)
    }
    var className: String{
        return type(of: self).className
    }
}

extension UICollectionView {
    
    //
    func registerCustomCell<T: UICollectionViewCell>(_ cell: T) {
        register(UINib(nibName: T.className, bundle: nil), forCellWithReuseIdentifier: T.className)
    }
    
    //
    func dequeCustomCell<T: UICollectionViewCell>(_ cell: T, _ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as! T
    }
}
