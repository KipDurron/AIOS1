//
//  GameService.swift
//  AIOS1
//
//  Created by Илья Кадыров on 19.02.2021.
//

import Foundation

class GameService {
    
    func setupQuestions() -> [Question] {
        var resturnList: [Question] = []
        let questionText1 = "кто написал \"Братья Карамазовы\" ?"
        let correctAnswer1 = Answer.B
        let options1 = [Answer.A: "A) Толстой", Answer.B: "B) Достоевский", Answer.C: "C) Лок", Answer.D: "D) Пушкин" ]
        let quest1 = Question(questionText: questionText1, correctAnswer: correctAnswer1, options: options1)
        resturnList.append(quest1)
        
        let questionText2 = "кто написал \"Идиот\" ?"
        let correctAnswer2 = Answer.A
        let options2 = [Answer.A: "A) Достоевский", Answer.B: "B) Мики Рурк", Answer.C: "C) Двенятин", Answer.D: "D) Шпак" ]
        let quest2 = Question(questionText: questionText2, correctAnswer: correctAnswer2, options: options2)
        resturnList.append(quest2)
        
        let questionText3 = "кто написал \"Star Wars Наследник империи\" ?"
        let correctAnswer3 = Answer.D
        let options3 = [Answer.A: "A) Достоевский", Answer.B: "B) Путин", Answer.C: "C) Щербаков", Answer.D: "D) Тимати Занн" ]
        let quest3 = Question(questionText: questionText3, correctAnswer: correctAnswer3, options: options3)
        resturnList.append(quest3)
        return resturnList
    }
    
    
}
