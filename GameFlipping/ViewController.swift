//
//  ViewController.swift
//  GameFlipping
//
//  Created by tuan.anhpham on 8/28/20.
//  Copyright © 2020 tuan.anhpham. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var model = CardModel()
    var cardArray = [Card]()
    var firstFlipCardIndex : IndexPath?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray = model.getCard()
        // Do any additional setup after loading the view.
        collectionView.delegate=self
        collectionView.dataSource=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
       
        cell.setCard(card)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMathed == false {
            cell.flip()
            card.isFlipped = true
            
            
            if firstFlipCardIndex == nil {
                firstFlipCardIndex = indexPath
                
            }else {
                checkForMathes(indexPath)
            }
            
        }
      
    }

    func checkForMathes(_ secondFlippeedCardIndex : IndexPath){
            
        let cardOneCell = collectionView.cellForItem(at: firstFlipCardIndex!) as? CardCollectionViewCell
        
        
        let cardTwoCell = collectionView.cellForItem(at: secondFlippeedCardIndex) as? CardCollectionViewCell
        
        let cardOne = cardArray[firstFlipCardIndex!.row]
        let cardTwo = cardArray[secondFlippeedCardIndex.row]
        
        if cardOne.imageName == cardTwo.imageName {
            cardOne.isMathed = true
            cardTwo.isMathed = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
        }else{
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
            
        }
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlipCardIndex!])
        }
                firstFlipCardIndex = nil
        }
    



} // end view control

    







