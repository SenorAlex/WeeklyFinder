//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Alex on 03.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultButton.layer.cornerRadius = 12
    }

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var montxTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLable: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = montxTF.text, let year = yearTF.text else {
            return
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        let weekday = dateFormatter.string(from: date)
        
        resultLable.text = weekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

