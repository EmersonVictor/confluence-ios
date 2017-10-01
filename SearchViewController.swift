//
//  searchView.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 28/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit
import MapKit

enum selectedScope:Int {
    case title = 0
    case location = 1
}

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var listFixed:[EventUnit] = []
    var listEvents:[EventUnit] = []
    
    var idTarget = ""

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        listFixed = Manager.sharedInstance.repositorio.sortAllByDistance(myLocation: locationManager.location!)
        listEvents = Manager.sharedInstance.repositorio.sortAllByDistance(myLocation: locationManager.location!)
 
        
        //listFixed = Manager.sharedInstance.repositorio.sortAllAlphabetically()
        //listEvents = Manager.sharedInstance.repositorio.sortAllAlphabetically()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.preservesSuperviewLayoutMargins = false
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
        searchBarSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - SearchBar Setup
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0, y:0, width:(UIScreen.main.bounds.width), height:70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name", "Place"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        self.tableView.tableHeaderView = searchBar
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        listEvents = listFixed
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if (searchBar.text?.isEmpty)! {
            listEvents = listFixed
            self.tableView.reloadData()
        } else {
            filterTableView(index: searchBar.selectedScopeButtonIndex, text: searchBar.text!)
        }
    }
    //MARK: - SearchBar functions
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            listEvents = listFixed
            self.tableView.reloadData()
        } else {
            filterTableView(index: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    func filterTableView(index:Int, text:String) {
        switch index {
        case selectedScope.title.rawValue:
            listEvents = listFixed.filter({ (mod) -> Bool in return mod.eventTitle.lowercased().contains(text.lowercased())})
        case selectedScope.location.rawValue:
            listEvents = listFixed.filter({ (mod) -> Bool in return mod.locationName.lowercased().contains(text.lowercased())})
        default:
            print("no type")
        }
        self.tableView.reloadData()
    }
    
    //MARK: - TableView setup
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEvents.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        
        let event = listEvents[indexPath.row]
        
        cell.eventName.text = event.eventTitle
        cell.eventAddress.text = event.locationName
        cell.eventImage.image = event.image
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.white
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
