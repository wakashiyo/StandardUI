//
//  Injectable.swift
//  TwoTabPage
//
//  Created by 吉川昂広 on 2019/03/28.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import Foundation

protocol ControllerInjectable {
    associatedtype Dependency
    static func makeInstance(dependency: Dependency) -> Self
}
