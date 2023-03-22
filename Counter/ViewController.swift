//
//  ViewController.swift
//  Counter
//
//  Created by Тадевос Курдоглян on 21.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var logText: UITextView!
    
    let date = Date()
    let calendar = Calendar.current
    
    
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func countButtonClicked(_ sender: Any) {
        count += 1
        countLabel.text = "Значение счётчика: \(count)"
    }
    
    
    @IBAction func plusButtonClicked(_ sender: Any) {
        countButtonClicked(sender)
        logText.text += "\n\(getDate()): значение изменено на +1"
        autoScroll()
    }
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        if count > 0 {
            count -= 1
            countLabel.text = "Значение счётчика: \(count)"
            logText.text += "\n\(getDate()): значение изменено на -1"
            autoScroll()
        } else {
            logText.text += "\n\(getDate()): попытка уменьшить значение счётчика ниже 0"
            autoScroll()
        }
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        count = 0
        countLabel.text = "Значение счётчика: \(count)"
        logText.text += "\n\(getDate()): значение сброшено"
        autoScroll()
    }
    
    func getDate() -> String {
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let textDate = "[\(day).\(month).\(year) \(hour):\(minutes)]"
        return textDate
    }
    
    func autoScroll() {
        let range = NSRange(location: logText.text.count - 1, length: 0)
        logText.scrollRangeToVisible(range)
    }
    
}

