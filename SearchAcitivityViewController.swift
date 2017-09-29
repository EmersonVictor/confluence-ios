//
//  SearchViewController.swift
//  tutorial
//
//  Created by Vitor Matheus de Azevedo Martins on 9/28/17.
//  Copyright © 2017 Vitor Matheus de Azevedo Martins. All rights reserved.
//

/* * Para adicionar mais um tipo de pesquisa, você deve:
 *    Adicionar o item em selectedScope
 *    Adicionar o item na lista scopeButtonTitles
 *    Adicionar o case em filterTableView
 */

import UIKit
import MapKit

enum selectedScope:Int {
    case name = 0
    case place = 1
}

class SearchActivityViewController: UITableViewController, UISearchBarDelegate, CLLocationManagerDelegate {
    var listEvents:[EventUnit] = []
    var listFixed:[EventUnit] = []
    var idTarget = ""
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarSetup()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        //listFixed = Manager.sharedInstance.repositorio.sortAllByDistance(myLocation: locationManager.location!)
        listFixed = Manager.sharedInstance.repositorio.eventItems
        print(listFixed)
        listEvents = listFixed
    }
    
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0, y:0, width:(UIScreen.main.bounds.width), height:70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name", "Place"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        self.tableView.tableHeaderView = searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Search bar delegate
    
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
        case selectedScope.name.rawValue:
            listEvents = listFixed.filter({ (mod) -> Bool in return mod.eventTitle.lowercased().contains(text.lowercased())})
        case selectedScope.place.rawValue:
            listEvents = listFixed.filter({ (mod) -> Bool in return mod.locationName.lowercased().contains(text.lowercased())})
        default:
            print("no type")
        }
        self.tableView.reloadData()
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
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFixed.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! TableViewCell
        
        let activity = listEvents[indexPath.row]
    /*
        cell.eventTitle.text = activity.eventTitle
        cell.eventAddress.text = activity.locationName
        cell.imgEvent.image = UIImage(named: activity.imageTitle)
        cell.idCell = activity.id
        */
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! TableViewCell
        
        //idTarget = cell.idCell
    }
    
    //MARK: - Open activity UIScreen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenActivitySearched" {
            if let destinationVC = segue.destination as? ThirdViewController {
                destinationVC.idActualEvent = idTarget
            }
        }
    }
    
    
}
