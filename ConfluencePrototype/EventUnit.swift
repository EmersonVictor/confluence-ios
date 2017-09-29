//
//  EventUnit.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 25/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import Foundation
import MapKit

class EventUnit: NSObject {
    
    let eventTitle: String
    let eventCreator: String
    let id: String
    let locationName: String
    let motivation: String
    //var timeUntil: Double
    let coordinate: CLLocationCoordinate2D
    let imageTitle: String
    var peopleEngaged: Int
    
    init(eventTitle: String, eventCreator: String, id: String, locationName: String, motivation: String, coordinate: CLLocationCoordinate2D, imageTitle: String){
        self.eventTitle = eventTitle
        self.eventCreator = eventCreator
        self.id = id
        self.locationName = locationName
        self.motivation = motivation
        //self.timeUntil = timeUntil
        self.coordinate = coordinate
        self.imageTitle = imageTitle
        peopleEngaged = 1
        super.init()
    }
    
    func engage(){
        peopleEngaged += 1
    }
    
    func disEngage(){
        peopleEngaged -= 1
    }
    
}
