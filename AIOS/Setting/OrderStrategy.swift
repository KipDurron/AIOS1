//
//  OrderStrategy.swift
//  AIOS1
//
//  Created by Илья Кадыров on 24.02.2021.
//

import Foundation

protocol OrderQuestionStrategy {
    func createQuestion() -> [Question]
}
