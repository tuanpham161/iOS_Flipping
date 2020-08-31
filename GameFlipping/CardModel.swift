//
//  CardModel.swift
//  GameFlipping
//
//  Created by tuan.anhpham on 8/28/20.
//  Copyright © 2020 tuan.anhpham. All rights reserved.
//

import Foundation

class CardModel {
    
    
    func getCard()-> [Card]{
        var generateCardArray = [Card]()
        for _ in 1...8 {
        let randomNumber = arc4random_uniform(13) + 1
            print(randomNumber)
            let cardOne = Card()
            cardOne.imageName =  "card\(randomNumber)"
            generateCardArray.append(cardOne)
            
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generateCardArray.append(cardTwo)
        }
        
        
        return generateCardArray
    }
}
