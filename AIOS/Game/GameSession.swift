//
//  GameSession.swift
//  AIOS1
//
//  Created by Илья Кадыров on 20.02.2021.
//

import Foundation

class GameSession {
    var countQuestion:Int = 0
    var countRightAns:Int = 0
}

extension GameSession: GameViewControllerDeligate {
    func setCountQuestion(count: Int) {
        self.countQuestion = count
    }
    
    func degreeRightAns() {
        self.countRightAns += 1
    }
    
    
}
