//
//  GridViewController.swift
//  Assignment
//
//  Created by Akshay Kumar on 08/05/19.
//  Copyright © 2019 Akshay Kumar. All rights reserved.
//

import UIKit
let cellIdentifier = "CollectionViewCell"
class GridViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
extension GridViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! UICollectionViewCell
     
        return cell
    }
    
   
    
}
