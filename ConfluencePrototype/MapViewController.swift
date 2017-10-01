//
//  FirstViewController.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 18/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch{
    func moveMap(placemark:MKPlacemark)
}

class FirstViewController: UIViewController, UISearchBarDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    var locationManager = CLLocationManager()
    var resultSearchController: UISearchController? = nil
    var id:String = ""
    
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
        
        //MARK: - SearchBar
        let mapSearchTable = storyboard!.instantiateViewController(withIdentifier: "MapTableViewController") as! MapTableViewController
        resultSearchController = UISearchController(searchResultsController: mapSearchTable)
        resultSearchController?.searchResultsUpdater = mapSearchTable
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        mapSearchTable.mapView = mapView
        mapSearchTable.handleMapSearchDelegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        centerMapOnLocation(location: locationManager.location!)
        mapView.delegate = self
        
        for event in (Manager.sharedInstance.repositorio.eventItems){
            let eventAnnotation = EventAnnotation(title: event.eventTitle, id: event.id, locationName: event.locationName,
                                        coordinate: event.coordinate, image: event.image)
            mapView.addAnnotation(eventAnnotation)
        }

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
    
}

extension FirstViewController: HandleMapSearch{
    func moveMap(placemark: MKPlacemark) {
        let location = CLLocation(latitude: placemark.coordinate.latitude, longitude: placemark.coordinate.longitude)
        centerMapOnLocation(location: location)
    }
}

