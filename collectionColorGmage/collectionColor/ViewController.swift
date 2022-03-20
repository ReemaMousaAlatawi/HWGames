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
                      SendValue ,
                      UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var falseAnswer: UILabel!
    @IBOutlet weak var trueAnswer: UILabel!
    
    var colors :[UIColor] = [.yellow ,
                             .yellow ,
                             .blue ,
                             .blue,
                             .green ,
                             .green]
    
    var selected = [false,false,false,false,false,false]

    var firstSelection = -1
    var lastSelection = -1

    var counter = 0
    
    func didSelected(index :Int) {
        if firstSelection != -1 && lastSelection != -1  {
            return
        }
        selected[index] = true
        if firstSelection ==  -1 {
            firstSelection = index
        }
        else {
            lastSelection = index
            checkColors()
        }
        
        collectionView.reloadData()
    }
    
    func resetColors(){
    
        selected = [false,false,false,false,false,false,]
        firstSelection = -1
        lastSelection = -1
        colors.shuffle()
        collectionView.reloadData()

    }
    
    func checkColors(){
        
        if colors[firstSelection] == colors[lastSelection] {
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                self.resetColors()
                self.counter += 1
                self.trueAnswer.text = "true Answer Score is : \(self.counter)"
            }
        }
        else {
  
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                self.resetColors()
                self.counter -= 1
                self.falseAnswer.text = "false Answer Score is :\(self.counter)"

            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 100, height: 100)
    }


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customeCell", for: indexPath) as! CustomCell
        
        cell.delegate = self
        cell.index = indexPath.row
        let selection = selected[indexPath.row]
        
        if selection == true{
            
            let  color = colors[indexPath.row]
            
            cell.backgroundColor = color
        }
        else {
            cell.backgroundColor = .black
        }
        
        return cell
    }
    
 }

protocol SendValue {
    func didSelected(index : Int )->Void
}


