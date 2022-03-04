//
//  ViewController.swift
//  collectionColor
//
//  Created by Reema Mousa on 30/07/1443 AH.
//

import UIKit

class ViewController: UIViewController ,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate,
                      UICollectionViewDelegateFlowLayout,
                      SendValue {
    
    var boleanArray = [true
                       ,false
                       ,false
                       ,false
                       ,false
                       ,false]
    
    func didSelected(index :Int) {
        
        let color = boleanArray[index]
        if color == false {
            return
        }
        
        if index == boleanArray.count-1{
            return
        }
        let nextCell = index+1
        boleanArray[index] = false
        boleanArray[nextCell] = true
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boleanArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customeCell", for: indexPath) as! CustomCell
        
        cell.delegate = self
        cell.index = indexPath.row
    
        let color = boleanArray[indexPath.row]
        if color == true {
            cell.backgroundColor = .red
        }
        else {
            cell.backgroundColor = .yellow
            collectionView.reloadData()
        }
        return cell
    }
}

protocol SendValue {
    func didSelected(index : Int )->Void
}
