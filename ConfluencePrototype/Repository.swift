//
//  Repository.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 25/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CloudKit

class Repository {
    
    var eventItems = [EventUnit]()
    
    func registerEvent(event: EventUnit){
        eventItems.append(event)
    }
    
    func eventExists (_ eventId: String) -> Bool {
        for e in eventItems {
            if e.id == eventId{
                return true
            }
        }
        return false
    }
    
    func index(of event:EventUnit) -> Int? {
        return eventItems.index(of: event)
    }
    
    func getItem(atIndex index: Int) -> EventUnit? {
        var result : EventUnit? = nil
        if index >= 0 && index < eventItems.count {
            result = eventItems[index]
        }
        return result
    }
    
    func size() -> Int {
        return eventItems.count
    }
    
    func remove(event: EventUnit){
        let i:Int = self.index(of: event)!
        eventItems.remove(at: i)
    }
    
    func replace(oldEvent:EventUnit, newEvent: EventUnit){
        let i:Int = self.index(of: oldEvent)!
        eventItems[i] = newEvent
    }
    
    func filterByName(name: String) -> EventUnit?{
        var result:EventUnit? = nil
        for e in eventItems{
            if(e.eventTitle == name){
                result = e
            }
        }
        return result
    }
    
    func filterById(id: String) -> EventUnit?{
        var result:EventUnit? = nil
        for e in eventItems{
            if(e.id == id){
                result = e
            }
        }
        return result
    }
    
    func containsText(searchTerm: String) -> [EventUnit]{
        var result:[EventUnit] = []
        for e in eventItems{
            if(e.eventTitle.contains(searchTerm)){
                result.append(e)
            }
        }
        return result
    }
    
    func sortAllAlphabetically() -> [EventUnit]{
        var newList = eventItems
        for slot in (1..<newList.count).reversed(){
            var positionOfMax = 0
            for location in 1...slot{
                if newList[location].eventTitle > newList[positionOfMax].eventTitle{
                    positionOfMax = location
                    let temp = newList[slot]
                    newList[slot] = newList[positionOfMax]
                    newList[positionOfMax] = temp
                }
            }
        }
        return newList
    }
    
    func sortAllByDistance(myLocation:CLLocation) -> [EventUnit]{
        var newList = eventItems
        for slot in (1..<newList.count).reversed(){
            var positionOfMax = 0
            for location in 1...slot{
                let eventLocationA = CLLocation(latitude: newList[location].coordinate.latitude, longitude: newList[location].coordinate.longitude)
                let eventLocationB = CLLocation(latitude: newList[positionOfMax].coordinate.latitude, longitude: newList[positionOfMax].coordinate.longitude)
                if (myLocation.distance(from: eventLocationA) > myLocation.distance(from: eventLocationB)){
                    positionOfMax = location
                    let temp = newList[slot]
                    newList[slot] = newList[positionOfMax]
                    newList[positionOfMax] = temp
                }
            }
        }
        return newList
    }
    
    func sortAlphabetically(list:[EventUnit]) -> [EventUnit]{
        var newList = list
        for slot in (1..<newList.count).reversed(){
            var positionOfMax = 0
            for location in 1...slot{
                if newList[location].eventTitle > newList[positionOfMax].eventTitle{
                    positionOfMax = location
                    let temp = newList[slot]
                    newList[slot] = newList[positionOfMax]
                    newList[positionOfMax] = temp
                }
            }
        }
        return newList
    }
    
    func sortAllByDate() -> [EventUnit]{
        var newList = eventItems
        for slot in (1..<newList.count).reversed(){
            var positionOfMax = 0
            for location in 1...slot{
                if newList[location].eventTitle > newList[positionOfMax].eventTitle{
                    positionOfMax = location
                    let temp = newList[slot]
                    newList[slot] = newList[positionOfMax]
                    newList[positionOfMax] = temp
                }
            }
        }
        return newList
    }
    
    func containsAndSortAlphabetically(searchTerm: String) -> [EventUnit]{
        let list = containsText(searchTerm: searchTerm)
        return sortAlphabetically(list: list)
    }
    
}
