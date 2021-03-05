//
//  OrderQuestionRandom.swift
//  AIOS1
//
//  Created by Илья Кадыров on 24.02.2021.
//

import Foundation

class OrderQuestionRandom: OrderQuestionStrategy {
    func createQuestion() -> [Question] {
        let increasQuestion = GameService().setupQuestions()
        var randomQuestion:[Question] = []
        let count = increasQuestion.count
        for i in 0..<count {
            randomQuestion = rearrange(array: increasQuestion, fromIndex: i, toIndex: Int.random(in: 0..<count))
        }
        return randomQuestion
    }
    
    func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        var arr = array
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)

        return arr
    }
}
