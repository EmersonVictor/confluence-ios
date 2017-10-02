//
//  ConfigAddressViewController.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 01/10/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit
import MapKit

protocol AddressMapSearch{
    func ops(placemark:MKPlacemark)
}

class ConfigAddressViewController: UIViewController, UISearchBarDelegate, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var resultSearchController: UISearchController? = nil
    let regionRadius: CLLocationDistance = 1000
    var locationManager = CLLocationManager()
    //var updateEventDelegate:UpdateAddress? = nil

    func checkLocationAuthorizationStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let addressSearchTable = storyboard!.instantiateViewController(withIdentifier: "SetAddressTableViewController") as! SetAddressTableViewController
        
        resultSearchController = UISearchController(searchResultsController: addressSearchTable)
        resultSearchController?.searchResultsUpdater = addressSearchTable
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        centerMapOnLocation(location: locationManager.location!)
        mapView.delegate = self
        
        addressSearchTable.mapView = mapView
        addressSearchTable.addressMapSearchDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            centerMapOnLocation(location: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error::(error)")
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

extension ConfigAddressViewController: AddressMapSearch {
    func ops(placemark: MKPlacemark) {
        dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
}
