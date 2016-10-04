//
//  LoginViewController.swift
//  CatRoll-SignUp
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Validations
    func textFieldsAreValid() -> Bool {
        
        let textFields: [UITextField] = [self.nameTextField, self.passwordTextField]
        let minimumLengthRequireMents: [UITextField : Int] = [
            self.nameTextField : 1,
            self.passwordTextField : 6
        ]
        
        
        for field in textFields {
            if let minimum = minimumLengthRequireMents[field] {
                if !textField(field, hasMinimumCharacters: minimum){
                    self.errorMessageLabel.isHidden = false
                    self.errorMessageLabel.text = "You need atleast \(minimum) character!"
                    return false
                }
            }
        }
        errorMessageLabel.isHidden = true
        return true
    }
    
    
    func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
        if let count = textField.text?.characters.count {
            if count >= minimum {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    
    func string(_ string: String, containsOnly characterSet: CharacterSet) -> Bool {
        for character in string.unicodeScalars {
            if !characterSet.contains(character) {
                errorMessageLabel.isHidden = false
                errorMessageLabel.text = "Invalid character"
                return false
            }
        }
        errorMessageLabel.isHidden = true
        return true
    }
    
    @IBAction func didTapLogIn(_ sender: UIButton) {
        _ = textFieldsAreValid()
    }
    
    // MARK: - UI Helper
    // (add the label update function here when the lesson calls for it)
    
    
    // MARK: - UITextFieldDelegate
    // (add delegate functions below here)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("\n + \(textField.debugId) SHOULD BEGIN")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("\n + \(textField.debugId) SHOULD BEGIN")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("\n + \(textField.debugId) SHOULD BEGIN")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\n + \(textField.debugId) SHOULD BEGIN")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\n + \(textField.debugId) SHOULD BEGIN")
        
        return textFieldsAreValid()
        
        
        //        if textField == self.nameTextField {
        //            let textIsLongEnough: Bool = self.textField(textField, hasMinimumCharacters: 1)
        //
        //            // write in code to handle this case
        //            // 1. check the Bool value, if false, write some error message to the errorLabel
        //
        //            if textIsLongEnough {
        //                return true
        //            } else {
        //                self.errorMessageLabel.isHidden = false
        //                self.errorMessageLabel.text = "You need atleast one character!"
        //                return false
        //            }
        //        }
        //
        //        if textField == self.passwordTextField {
        //            let textIsLongEnough: Bool = self.textField(textField, hasMinimumCharacters: 6)
        //
        //            // write in code to handle this case
        //            // 1. check the Bool value, if false, write some error message to the errorLabel
        //
        //
        //            if textIsLongEnough {
        //                return true
        //            } else {
        //                self.errorMessageLabel.isHidden = false
        //                self.errorMessageLabel.text = "You need atleast six characters!"
        //                return false
        //            }
        //        }
        //        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // only interested in doing this validation for self.nameTextField
        // and per documentation, string can be empty if the change is a deletion
        
        if textField == self.nameTextField && string != "" {
            return self.string(string, containsOnly: CharacterSet.letters.union(CharacterSet.whitespaces))
        }
        
        return true
    }
    
    
    
    
    
    
    func updateErrorLabel(with message: String) {
        if self.errorMessageLabel.isHidden {
            self.errorMessageLabel.isHidden = false
        }
        
        self.errorMessageLabel.text = message
        self.errorMessageLabel.textColor = UIColor.red
        self.errorMessageLabel.backgroundColor = UIColor.red.withAlphaComponent(0.25)
    }
}
