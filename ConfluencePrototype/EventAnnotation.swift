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

class EventAnnotation: NSObject, MKAnnotation {

    let title: String?
    let id: String
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let image: UIImage
    
    init(title: String, id: String, locationName: String, coordinate: CLLocationCoordinate2D, image: UIImage){
        self.title = title
        self.id = id
        self.locationName = locationName
        self.coordinate = coordinate
        self.image = image
        super.init()
    }
    
    init(event: EventUnit){
        self.title = event.eventTitle
        self.id = event.id
        self.locationName = event.locationName
        self.coordinate = event.coordinate
        self.image = event.image
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
