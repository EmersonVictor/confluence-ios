//
//  myActivitiesView.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 28/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit
import MapKit

class myActivitiesView: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    @IBOutlet weak var myEventsTable: UITableView!
    
    var myEventsData:[EventUnit] = []
    var idTarget = ""
    
    @IBAction func myActivitiesDestroy(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        //Change to list of my activities
        myEventsData = Manager.sharedInstance.usuario.eventCreated.sortAllByDistance(myLocation: locationManager.location!)
        
        self.myEventsTable.delegate = self
        self.myEventsTable.dataSource = self
        self.myEventsTable.preservesSuperviewLayoutMargins = false
        self.myEventsTable.separatorInset = UIEdgeInsets.zero
        self.myEventsTable.layoutMargins = UIEdgeInsets.zero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myEventsData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "event1Cell", for: indexPath) as! MyActivitiesTableViewCell
        
        let event = myEventsData[indexPath.row]
        
        cell.eventName.text = event.eventTitle
        cell.eventAddress.text = event.locationName
        cell.eventImage.image = UIImage(named: event.imageTitle)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //MARK: - Location setup
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            print("location::(location)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error::(error)")
    }
}
