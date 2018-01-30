//
//  ViewController.swift
//  FindMeAge
//
//  Created by SotheaNem on 1/30/18.
//  Copyright © 2018 Sothea. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var txtAgeInput: UITextField!
    @IBOutlet weak var lblShowAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func findAgeAction(_ sender: Any) {
        findAge()
    }
    func findAge(){
            let txtAgeField = Int(txtAgeInput.text!)
        if(txtAgeInput.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message: "Fill in again", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style:.default, handler: nil)
            txtAgeInput.text = ""
            lblShowAge.text  = "Your age is 0 year."
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }else {
            let date = Date()
            let calender = Calendar.current
            let year = calender.component(.year, from: date)
            let personAge = year - txtAgeField!
            lblShowAge.text = "Your age is \(personAge) year old."
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        findAge()
        self.view.endEditing(true)
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let MAXLENGTH = 4
        guard let text = textField.text else { return true}
        let newLenght = text.count + string.count - range.length
        
        return newLenght <= MAXLENGTH
    }
}

