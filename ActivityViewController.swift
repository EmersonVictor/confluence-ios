//
//  ThirdViewController.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 22/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit
import MapKit

class ActivityViewController: UIViewController {

    var event:EventUnit = EventUnit(eventTitle: "Evento1", eventCreator: "1", id: "1", locationName: "Casa da Mãe Joana", motivation: "Queremos saber o que é Caviar", coordinate: CLLocationCoordinate2D(latitude: -8.055668, longitude: -34.951578), imageTitle: "profile-header.png")
    
    @IBOutlet weak var btnEngage: UIButton!
    
    @IBOutlet weak var eventPhoto: UIImageView!
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func engageEvent(_ sender: Any) {
        if btnEngage.currentTitle == "Engage" {
            let index = Manager.sharedInstance.repositorio.index(of: event)
            Manager.sharedInstance.repositorio.eventItems[index!].peopleEngaged += 1
            Manager.sharedInstance.usuario.eventEngaged.registerEvent(event: self.event)
            print(Manager.sharedInstance.usuario.eventEngaged.eventItems)
            btnEngage.setTitle("Engaged", for: .normal)
            btnEngage.setTitleColor(UIColor.cyan, for: .normal)
        } else {
            let index = Manager.sharedInstance.repositorio.index(of: event)
            Manager.sharedInstance.repositorio.eventItems[index!].peopleEngaged -= 1
            Manager.sharedInstance.usuario.eventEngaged.remove(event: self.event)
            btnEngage.setTitle("Engage", for: .normal)
            btnEngage.setTitleColor(UIColor.blue, for: .normal)
        }
        engagedNumber.text = String(event.peopleEngaged)
    }
    var idActualEvent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !idActualEvent.isEmpty {
            event = Manager.sharedInstance.repositorio.filterById(id: idActualEvent)!
        
            eventName.text = event.eventTitle
            motivation.text = event.motivation
            address.text = event.locationName
            eventPhoto.image = UIImage(named: event.imageTitle)
            engagedNumber.text = String(event.peopleEngaged)
        }
        
        if (Manager.sharedInstance.usuario.id == event.eventCreator){
            btnEngage.isHidden = true
        }
        
        if (Manager.sharedInstance.usuario.eventEngaged.eventExists(idActualEvent)){
            btnEngage.setTitle("Engaged", for: .normal)
            btnEngage.setTitleColor(UIColor.cyan, for: .normal)
        }
        
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
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var engagedNumber: UILabel!
    

}
