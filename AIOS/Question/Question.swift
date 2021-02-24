//
//  Question.swift
//  AIOS1
//
//  Created by Илья Кадыров on 19.02.2021.
//

import Foundation

struct Question {
    
    var questionText: String
    var correctAnswer : Answer
    var options: [Answer : String]
    
    init(questionText: String, correctAnswer: Answer, options: [Answer : String]) {
        self.questionText = questionText
        self.correctAnswer = correctAnswer
        self.options = options
    }
    
    
}
