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
    var contador = 0
    
    private override init(){
        usuario = User(id: "1", username: "Emerson", profileImage: "dog-1224267_1920.jpg")
        repositorio = Repository()
        
        let eventOne: EventUnit = EventUnit(eventTitle: "Introdução a lógica de computação", eventCreator: "Castor", id: "1", locationName: "CIN  - Centro de Informática", motivation: "Estimular os futuros desenvolvedores", date: "10-12-2017 14:00", coordinate: CLLocationCoordinate2D(latitude: -8.055668, longitude: -34.951578), image: UIImage(named: "castor.jpg")!)
        //let eventThree: EventUnit = EventUnit(eventTitle: "Arborização", eventCreator: "Fernanda", id: "2", locationName: "CAC - Centro de Artes e Comunicação", motivation: "Revitalizar o ambiente do centro de artes", date: "11-02-2017 08:00", coordinate: CLLocationCoordinate2D(latitude: -8.053812, longitude: -34.954644), image: UIImage(named: "arvore.jpg")!)
        let eventFour: EventUnit = EventUnit(eventTitle: "Aula de Capoeira", eventCreator: "Mestre Osvaldo", id: "3", locationName: "Marco Zero", motivation: "Aula de capoeira para todos os públicos (iniciante à avançado)", date: "11-15-2017 08:30", coordinate: CLLocationCoordinate2D(latitude: -8.063153, longitude: -34.871117), image: UIImage(named: "capoeira.jpg")!)
        let eventFive: EventUnit = EventUnit(eventTitle: "Atividades recreativas", eventCreator: "Dona Neneca", id: "4", locationName: "Lar Batista Elizabeth Mein", motivation: "Relização de atividades recreativas para as crianças do orfanato", date: "10-12-2017 10:00", coordinate: CLLocationCoordinate2D(latitude: -8.043808, longitude: -34.927336), image: UIImage(named: "kids.png")!)
        let eventSix: EventUnit = EventUnit(eventTitle: "Adoção de animais", eventCreator: "Pedro", id: "5", locationName: "ONG PetPE", motivation: "Os animaizinhos esão tristes e precisam de pessoas para brincar com eles", date: "10-07-2017 20:00", coordinate: CLLocationCoordinate2D(latitude: -8.159588, longitude: -34.911214), image: UIImage(named: "dog.jpg")!)
        
        repositorio.registerEvent(event: eventOne)
        //repositorio.registerEvent(event: eventThree)
        repositorio.registerEvent(event: eventFour)
        repositorio.registerEvent(event: eventFive)
        repositorio.registerEvent(event: eventSix)
        
        //usuario.eventCreated.registerEvent(event: eventThree)
        //usuario.eventCreated.registerEvent(event: eventFive)
        //usuario.eventCreated.registerEvent(event: eventSix)
        
        super.init()
    }
    
    func setUser(usuario: User){
        self.usuario = usuario
    }
    
    func setRepository(repositorio: Repository){
        self.repositorio = repositorio
    }
 
}
