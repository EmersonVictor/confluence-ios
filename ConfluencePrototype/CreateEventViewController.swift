//
//  CreateEventViewController.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 30/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit
import MapKit

class CreateEventViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventAddress: UITextField!
    @IBOutlet weak var eventMotivation: UITextView!
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventChangeImage: UIButton!
    
    @IBAction func changeImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            eventImage.image = image
        } else {
            // Error message
        }
        
        self.dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "The event image has been changed.", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.eventAddress.delegate = self
        self.eventMotivation.delegate = self
        self.eventName.delegate = self
        self.eventMotivation.delegate = self
        
        eventMotivation.layer.cornerRadius = 5
        eventMotivation.layer.borderColor = UIColor.lightGray.cgColor
        eventMotivation.layer.borderWidth = 0.3
        eventMotivation.textContainer.maximumNumberOfLines = 4
        eventMotivation.textContainer.lineBreakMode = .byWordWrapping
        
        eventImage.layer.cornerRadius = eventImage.frame.height/2
        eventImage.clipsToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textField.resignFirstResponder()
            return false
        }
        return true
    }

    @IBAction func datePickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let strDate = dateFormatter.string(from: datePicker.date)
        self.eventDate.text = strDate
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}