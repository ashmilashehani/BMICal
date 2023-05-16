//
//  ViewController.swift
//  BMICal
//
//  Created by MacBook Aor on 2023-05-16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var BMILabel: UILabel!
    
    @IBOutlet var classLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // when you start your app, it is going to call voewDidLoad function
        
        BMILabel.text = "BMI Result"
        classLabel.text = "Classification"
    }


    @IBAction func calculateBMI(_ sender: Any) {
        guard let heightString = heightTextField.text,
              let height = Double(heightString), height > 0
        else{
            BMILabel.text = "ERROR"
            classLabel.text = "Error"
            return
        }
        
        guard let weightString = weightTextField.text,
              let weight = Double(weightString), weight > 0
        else{
            BMILabel.text = "ERROR"
            classLabel.text = "Error"
            return
        }
        
        let result = weight / (height * height)
        BMILabel.text = String((result * 10).rounded() / 10)
        
        switch result {
            
        case let result where result < 18.5:
            classLabel.text = "UnderWeight"
         
        case let result where result < 24.9:
            classLabel.text = "Normal"
            
        case let result where result < 29.9:
            classLabel.text = "OverWeight"
            
        case let result where result < 34.9:
            classLabel.text = "Obesity(Class I)"

        case let result where result < 39.9:
            classLabel.text = "Obesity(Class II)"
            
        case let result where result < 40:
            classLabel.text = "Extreme Obesity"
            

        default:
            classLabel.text = "Error"
        }
        
    }
    
    
    @IBAction func GetPlan(_ sender: Any) {
       
                let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "firstViewController") as! firstViewController
            self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
}

