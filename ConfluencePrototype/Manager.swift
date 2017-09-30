//
//  Manager.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 27/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import Foundation
import MapKit

class Manager: NSObject{
    static let sharedInstance = Manager()
    var usuario:User
    var repositorio:Repository
    
    private override init(){
        usuario = User(id: "1", username: "Jorge", profileImage: "dog-1224267_1920.jpg")
        repositorio = Repository()
        
        let eventOne: EventUnit = EventUnit(eventTitle: "Evento1", eventCreator: "1", id: "1", locationName: "Casa da Mãe Joana", motivation: "Queremos saber o que é Caviar", coordinate: CLLocationCoordinate2D(latitude: -8.055668, longitude: -34.951578), imageTitle: "profile-header.png")
        let eventTwo: EventUnit = EventUnit(eventTitle: "Evento2", eventCreator: "1", id: "2", locationName: "Pra lá de Bagdá", motivation: "Vamos dançar como vampiros", coordinate: CLLocationCoordinate2D(latitude: 29.977296, longitude: 31.132496), imageTitle: "footsteps-blue.png")
        let eventThree: EventUnit = EventUnit(eventTitle: "Bevento3", eventCreator: "1", id: "3", locationName: "Casa do Pai João", motivation: "Pew Pew eu sou um mutante", coordinate: CLLocationCoordinate2D(latitude: -8.053812, longitude: -34.954644), imageTitle: "footsteps-yellow.png")
        let eventFour: EventUnit = EventUnit(eventTitle: "Aula de Capoeira", eventCreator: "1", id: "4", locationName: "Marco Zero", motivation: "Aula de capoeira para todos os públicos (iniciante à avançado)", coordinate: CLLocationCoordinate2D(latitude: -8.063153, longitude: -34.871117), imageTitle: "profile-picture.png")
        let eventFive: EventUnit = EventUnit(eventTitle: "Atividades recreativas", eventCreator: "1", id: "5", locationName: "Lar Batista Elizabeth Mein", motivation: "Relização de atividades recreativas para as crianças do orfanato", coordinate: CLLocationCoordinate2D(latitude: -8.043808, longitude: -34.927336), imageTitle: "engage.png")
        let eventSix: EventUnit = EventUnit(eventTitle: "Adoção de animais", eventCreator: "1", id: "6", locationName: "ONG PetPE", motivation: "Adote um doge ou um gatíneo", coordinate: CLLocationCoordinate2D(latitude: -8.159588, longitude: -34.911214), imageTitle: "tutorial-bg-1.jpg")
        
        repositorio.registerEvent(event: eventOne)
        repositorio.registerEvent(event: eventTwo)
        repositorio.registerEvent(event: eventThree)
        repositorio.registerEvent(event: eventFour)
        repositorio.registerEvent(event: eventFive)
        repositorio.registerEvent(event: eventSix)
        
        super.init()
    }
    
    func setUser(usuario: User){
        self.usuario = usuario
    }
    
    func setRepository(repositorio: Repository){
        self.repositorio = repositorio
    }
 
}
