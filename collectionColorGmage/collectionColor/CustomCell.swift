//
//  CustomCell.swift
//  collectionColor
//
//  Created by Reema Mousa on 01/08/1443 AH.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    var delegate :SendValue?
    var index :Int!
    
    @IBOutlet weak var btnCell: UIButton!

    @IBAction func btnCell1(_ sender: Any) {
                delegate?.didSelected(index: index)
    }

    
}
