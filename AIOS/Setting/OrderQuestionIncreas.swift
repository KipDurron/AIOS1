//
//  OrderQuestionIncrease.swift
//  AIOS1
//
//  Created by Илья Кадыров on 24.02.2021.
//

import Foundation

class OrderQuestionIncreas: OrderQuestionStrategy {
    func createQuestion() -> [Question] {
        return GameService().setupQuestions()
    }
    
}
