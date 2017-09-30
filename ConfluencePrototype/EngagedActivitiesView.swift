//
//  engagedActivitiesView.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 28/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit
import MapKit

class engagedActivitiesView: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var tableContent: UITableView!
    
    //Replace by the engaged activity list
    var engagedActivitiesData:[EventUnit] = []
    
    var idTarget = ""
    
    @IBAction func destroyView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        engagedActivitiesData = Manager.sharedInstance.repositorio.sortAllByDistance(myLocation: locationManager.location!)
        
        // Do any additional setup after loading the view.
        self.tableContent.delegate = self
        self.tableContent.dataSource = self
        self.tableContent.preservesSuperviewLayoutMargins = false
        self.tableContent.separatorInset = UIEdgeInsets.zero
        self.tableContent.layoutMargins = UIEdgeInsets.zero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return engagedActivitiesData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        

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

    /*
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let event = listEvents[indexPath.row]
        idTarget = event.id
        self.performSegue(withIdentifier: "SelectedEventInSearch", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectedEventInSearch" {
            if let destinationVC = segue.destination as? ActivityViewController {
                destinationVC.idActualEvent = idTarget
            }
        }
    }
 */
}
