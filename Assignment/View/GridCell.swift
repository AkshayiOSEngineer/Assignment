//
//  GridCell.swift
//  Assignment
//
//  Created by Akshay Kumar on 08/05/19.
//  Copyright © 2019 Akshay Kumar. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    @IBOutlet weak var squareView: UIView!
    func configureWith(_ state: Bool) {
        squareView.backgroundColor = state ? .black : .white
    }
}
