//
//  GridViewController.swift
//  Assignment
//
//  Created by Akshay Kumar on 08/05/19.
//  Copyright © 2019 Akshay Kumar. All rights reserved.
//

import UIKit
let cellIdentifier = "CollectionViewCellIdentifier"
class GridViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: [Cell]  = []
    let width = 20
    let height = 20
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(width: width, height: height)
        game.addStateObserverToNotifyView { [weak self] state in
            self?.display(state)
        }
    }
    
    func display(_ state: GameState) {
        self.dataSource = state.cells
        collectionView.reloadData()
    }
}
extension GridViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return width * height
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GridCell
        cell.configureWith(dataSource[indexPath.item].isAlive)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let squareSize: CGFloat = self.view.bounds.width / CGFloat(width)
        return CGSize(width: (squareSize), height: (squareSize ))
    }
    
}
