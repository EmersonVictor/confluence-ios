//
//  ThirdViewController.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 22/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var btnEngage: UIButton!
    
    @IBOutlet weak var eventPhoto: UIImageView!
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func engageEvent(_ sender: Any) {
        if btnEngage.currentTitle == "Engage" {
            btnEngage.setTitle("Engaged", for: .normal)
            btnEngage.setTitleColor(UIColor.cyan, for: .normal)
        } else {
            btnEngage.setTitle("Engage", for: .normal)
            btnEngage.setTitleColor(UIColor.cyan, for: .normal)
        }
    }
    var idActualEvent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var event:EventUnit = Manager.sharedInstance.repositorio.filterById(id: idActualEvent)!

        // Do any additional setup after loading the view.
        eventPhoto.layer.cornerRadius = eventPhoto.frame.height/2
        eventPhoto.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var motivation: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var creatorName: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var engagedNumber: UILabel!
    

}
