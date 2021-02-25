//
//  ViewController.swift
//  AIOS1
//
//  Created by Илья Кадыров on 25.02.2021.
//

import UIKit

class SettingController: UIViewController {

    @IBOutlet weak var orderQuestion: UISegmentedControl!
    
    private var selectedOrder: Order {
        switch self.orderQuestion.selectedSegmentIndex {
        case 0:
            return .increas
        case 1:
            return .random
        default:
            return .increas
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Game.shared.settingOrder = selectedOrder
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
