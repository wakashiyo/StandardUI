//
//  CardViewController.swift
//  CardUI
//
//  Created by 吉川昂広 on 2019/03/22.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    struct Dependency {
        let collectionViewCell: CollectionViewCell
        let cellData: [String]
    }
    
    private var dependency: Dependency!
    
    static func makeInstance(dependency: Dependency) -> CardViewController {
        let viewController = CardViewController()
        viewController.dependency = dependency
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerCustomCell(dependency.collectionViewCell)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = setCellSize()
        layout.minimumLineSpacing = 50
        collectionView.collectionViewLayout = layout
    }
    
    func setCellSize() -> CGSize {
        let width = UIScreen.main.bounds.width - 48
        let height = width * 3/4
        return CGSize(width: width, height: height)
    }
    
}

extension CardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dependency.cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCustomCell(dependency.collectionViewCell, indexPath)
        cell.setUp(str: dependency.cellData[indexPath.row])
        return cell
    }
    
}

extension CardViewController: UICollectionViewDelegate {}
