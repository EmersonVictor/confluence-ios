//
//  Event.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 25/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Event: NSObject, MKAnnotation {

    let title: String?
    let id: String
    let locationName: String
    //var timeUntil: Double
    let coordinate: CLLocationCoordinate2D
    let image: UIImage
    
    init(title: String, id: String, locationName: String, coordinate: CLLocationCoordinate2D, image: String){
        self.title = title
        self.id = id
        self.locationName = locationName
        //self.timeUntil = timeUntil
        self.coordinate = coordinate
        self.image = UIImage(named:image)!
        super.init()
    }
    
    var subtitle: String?{
        return locationName
    }
    
    func mapItem() -> MKMapItem{
        let addressDictionary = [String(CNPostalAddressStreetKey):subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
}
