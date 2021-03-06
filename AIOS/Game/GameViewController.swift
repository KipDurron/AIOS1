//
//  GameViewController.swift
//  AIOS1
//
//  Created by Илья Кадыров on 19.02.2021.
//

import UIKit

protocol GameViewControllerDeligate: class {
    func setCountQuestion(count:Int)
    func degreeRightAns()
}

class GameViewController: UIViewController {
    
    var listQuestion: [Question] = []
    let gameService = GameService()
    var currentRightAnswer: Answer?
    var currentQuestion: Question?
    weak var gameDeligate: GameViewControllerDeligate?
    let orderSetting = Game.shared.settingOrder
    private var orderQuestionStrategy: OrderQuestionStrategy {
        switch self.orderSetting {
        case .increas:
            return OrderQuestionIncreas()
        case .random:
            return OrderQuestionRandom()
        }
    }
    
//    var currentResult: String {
//
//    }
    
    @IBOutlet weak var currentResultLabel: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerA: UILabel!
    @IBOutlet weak var answerB: UILabel!
    @IBOutlet weak var answerC: UILabel!
    @IBOutlet weak var answerD: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentResultLabel.text = "0"
        self.notificationCenterSetting()
        self.listQuestion = orderQuestionStrategy.createQuestion()
        getCurrentQuestion()
        // Do any additional setup after loading the view.
        let tapA = UITapGestureRecognizer(target: self, action: #selector(GameViewController.tapAnswer))
        answerA.isUserInteractionEnabled = true
        answerA.addGestureRecognizer(tapA)
        let tapB = UITapGestureRecognizer(target: self, action: #selector(GameViewController.tapAnswer))
        answerB.isUserInteractionEnabled = true
        answerB.addGestureRecognizer(tapB)
        let tapC = UITapGestureRecognizer(target: self, action: #selector(GameViewController.tapAnswer))
        answerC.isUserInteractionEnabled = true
        answerC.addGestureRecognizer(tapC)
        let tapD = UITapGestureRecognizer(target: self, action: #selector(GameViewController.tapAnswer))
        answerD.isUserInteractionEnabled = true
        answerD.addGestureRecognizer(tapD)
        
        // Создаём сессию
        let gameSession = GameSession()
        Game.shared.gameSession = gameSession
        self.gameDeligate = gameSession
        gameDeligate?.setCountQuestion(count: self.listQuestion.count)
    }
    
    @objc
    func tapAnswer(sender:UITapGestureRecognizer) {
        let currentAnswerText = (sender.view as! UILabel).text!
        let currentAnswer = String(currentAnswerText[currentAnswerText.startIndex])
       
        if currentAnswer == self.currentRightAnswer?.rawValue {
            //Верно ответили
            gameDeligate?.degreeRightAns()
            NotificationCenter.default.post(name: Notification.Name("UpdateResultLabel"), object: nil)
            nextQuestion()
            
        } else {
            //Конец игры
            endGame()
            dismiss(animated: true)
        }
        
    }
    
    private func notificationCenterSetting() {
        NotificationCenter.default
            .addObserver(self, selector: #selector(updateResult), name: Notification.Name(rawValue: "UpdateResultLabel"), object: nil)
    }
    
    @objc private func updateResult() {
        self.currentResultLabel.text = String(getPercent())
    }
    
    func getPercent() -> Float {
        return Float(Game.shared.gameSession!.countRightAns) / Float(Game.shared.gameSession!.countQuestion) * 100
    }
    
    private func endGame() {
        let percent = getPercent()
        let newResult = Result(date: Date(), persent: percent)
//        var results = Game.shared.resultCaretaker.retrieveResults()
//        results.append(newResult)
//        Game.shared.results = results
        Game.shared.addResult(newResult: newResult)
        Game.shared.gameSession = nil
    }
    
    private func nextQuestion() {
        if self.listQuestion.count > 1 {
            self.listQuestion.removeFirst()
            getCurrentQuestion()
        } else {
            //Конец игры
            endGame()
            dismiss(animated: true)
        }
        
    }
    
    private func getCurrentQuestion() {
        let firstQuestion = self.listQuestion[0]
        self.questionText.text = firstQuestion.questionText
        self.answerA.text = firstQuestion.options[Answer.A]
        self.answerB.text = firstQuestion.options[Answer.B]
        self.answerC.text = firstQuestion.options[Answer.C]
        self.answerD.text = firstQuestion.options[Answer.D]
        self.currentRightAnswer = firstQuestion.correctAnswer
        self.currentQuestion = firstQuestion
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
