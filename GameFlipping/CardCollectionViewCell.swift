//
//  CardCollectionViewCell.swift
//  GameFlipping
//
//  Created by tuan.anhpham on 8/28/20.
//  Copyright © 2020 tuan.anhpham. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var forntimageView: UIImageView!
    
    var card: Card?
    func setCard(_ card:Card)  {
        self.card = card
        
        if card.isMathed == true {
            backImageView.alpha = 0
            forntimageView.alpha = 0
            
            return
        }
        else{
            backImageView.alpha = 1
                       forntimageView.alpha = 1
        }
        
        
        forntimageView.image = UIImage(named: card.imageName)
        
        
        
        
        if card.isFlipped == true {
            
            UIView.transition(from: backImageView, to: forntimageView, duration: 0, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
            
            
        } else {
            UIView.transition(from: forntimageView , to: backImageView, duration: 0, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        }
    }
    
    
    func flip(){
        UIView.transition(from: backImageView, to: forntimageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews]  , completion: nil)
    }
    
    
    
    func flipBack(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
            UIView.transition(from: self.forntimageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
        
    }
    
    
    func remove(){
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut , animations: {
            self.forntimageView.alpha = 0
            
        }, completion: nil)
        
    }
}
