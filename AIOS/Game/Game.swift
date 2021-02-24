//
//  Game.swift
//  AIOS1
//
//  Created by Илья Кадыров on 20.02.2021.
//

import Foundation

class Game {
    private init() {
//        self.results = []
        self.results = resultCaretaker.retrieveResults()
    }
    static let shared = Game()
    var gameSession: GameSession?
    let resultCaretaker = ResultCaretaker()
    private (set) var results: [Result] {
        didSet {
            resultCaretaker.save(records: self.results)
        }
    }
    
    func addResult(newResult: Result) {
        self.results.append(newResult)
    }
    
}
