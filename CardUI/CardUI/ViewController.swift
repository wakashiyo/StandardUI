//
//  ViewController.swift
//  CardUI
//
//  Created by 吉川昂広 on 2019/03/18.
//  Copyright © 2019 takahiro yoshikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cell = CollectionViewCell()
    
    let data = cellData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerCustomCell(cell)
        
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

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = collectionView.dequeCustomCell(cell, indexPath)
        c.setUp(str: data[indexPath.row])
        return c
    }
    
}

extension ViewController: UICollectionViewDelegate {}

