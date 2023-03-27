//
//  ViewController.swift
//  Counter
//
//  Created by Тадевос Курдоглян on 21.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var logText: UITextView!
    
    private let date = Date()
    private let calendar = Calendar.current
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func countButtonClicked(_ sender: Any) {
        increaseCounter()
    }
    
    @IBAction func plusButtonClicked(_ sender: Any) {
        increaseCounter()
        logText.text += "\n\(getDate()): значение изменено на +1"
        autoScroll()
    }
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        decreaseCounter()
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        count = 0
        countLabel.text = "Значение счётчика: \(count)"
        logText.text += "\n\(getDate()): значение сброшено"
        autoScroll()
    }
    
    private func getDate() -> String {
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let textDate = "[\(day).\(month).\(year) \(hour):\(minutes)]"
        return textDate
    }
    
    private func autoScroll() {
        let range = NSRange(location: logText.text.count - 1, length: 0)
        logText.scrollRangeToVisible(range)
    }
    
    private func increaseCounter() {
        count += 1
        countLabel.text = "Значение счётчика: \(count)"
    }
    
    private func decreaseCounter() {
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
}
