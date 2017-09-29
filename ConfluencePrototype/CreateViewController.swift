//
//  CreateViewController.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 22/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var EventName: UITextField!
    @IBOutlet weak var motivation: UITextView!
    @IBOutlet weak var daysEvent: UITextField!
    @IBOutlet weak var hoursEvent: UITextField!
    @IBOutlet weak var minutesEvent: UITextField!
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EventName.placeholder = "Event name"
        motivation.text = "Type the motivation"

        EventName.delegate = self
        motivation.delegate = self
        daysEvent.delegate = self
        hoursEvent.delegate = self
        minutesEvent.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        return true
    }

}
