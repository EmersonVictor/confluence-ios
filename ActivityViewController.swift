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

    var event:EventUnit = EventUnit(eventTitle: "Evento1", eventCreator: "1", id: "1", locationName: "Casa da Mãe Joana", motivation: "Queremos saber o que é Caviar", date: "10-28-1995 20:00", coordinate: CLLocationCoordinate2D(latitude: -8.055668, longitude: -34.951578), image: UIImage(named: "profile-header.png")!)
    
    @IBOutlet weak var btnEngage: UIButton!
    
    @IBOutlet weak var eventPhoto: UIImageView!
    
    @IBAction func dismissView(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func engageEvent(_ sender: Any) {
        if !Manager.sharedInstance.usuario.eventEngaged.eventExists(event.id) {
            let index = Manager.sharedInstance.repositorio.index(of: event.id)
            Manager.sharedInstance.repositorio.eventItems[index].peopleEngaged += 1
            Manager.sharedInstance.usuario.eventEngaged.registerEvent(event: event)
            btnEngage.setTitle("Engaged", for: .normal)
            btnEngage.setTitleColor(UIColor(red: 1.0, green: 0.7, blue: 0.28, alpha: 1.0), for: .normal)
        } else {
            let index = Manager.sharedInstance.repositorio.index(of: event.id)
            Manager.sharedInstance.repositorio.eventItems[index].peopleEngaged -= 1
            Manager.sharedInstance.usuario.eventEngaged.remove(event: event)
            btnEngage.setTitle("Engage", for: .normal)
            btnEngage.setTitleColor(UIColor(red: 0.15, green: 0.64, blue: 0.65, alpha: 1.0), for: .normal)
        }
        engagedNumber.text = String(event.peopleEngaged)
    }
    var idActualEvent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userName = Manager.sharedInstance.usuario.username

        if !idActualEvent.isEmpty {
            event = Manager.sharedInstance.repositorio.filterById(id: idActualEvent)!
        
            eventName.text = event.eventTitle.uppercased()
            //Should receive the name of who has the event.eventCreator id
            creatorName.text = event.eventCreator
            motivation.text = event.motivation
            motivation.sizeToFit()
            address.text = event.locationName
            eventPhoto.image = event.image
            engagedNumber.text = String(event.peopleEngaged)
        }
        
        if (userName == event.eventCreator) {
            btnEngage.isEnabled = false
            btnEngage.isHidden = true
        } else if (Manager.sharedInstance.usuario.eventEngaged.eventExists(event.id)){
            btnEngage.setTitle("Engaged", for: .normal)
            btnEngage.setTitleColor(UIColor(red: 1.0, green: 0.7, blue: 0.28, alpha: 1.0), for: .normal)
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
