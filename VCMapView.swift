//
//  VCMapView.swift
//  ConfluencePrototype
//
//  Created by Gabriel D'Luca Souza Viana on 25/09/17.
//  Copyright © 2017 Gabriel D'Luca Souza Viana. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension FirstViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView!, viewFor annotation: MKAnnotation!) -> MKAnnotationView!{
        if let annotation = annotation as? EventAnnotation {
            let identifier = "pin"

            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView{
                dequeuedView.annotation = annotation
                return dequeuedView
            }else{
                let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.isEnabled = true
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: -5)
                let btn = UIButton(type: .detailDisclosure) as UIView
                let img = UIImageView(image: annotation.image) as UIView
                img.frame = CGRect(x:0, y:0, width: 50, height: 50)
                view.leftCalloutAccessoryView = img
                view.rightCalloutAccessoryView = btn
                view.animatesDrop = true
                view.pinTintColor = UIColor.purple
                return view
            }
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        let annotation = view.annotation as! EventAnnotation
        self.id = annotation.id
        self.performSegue(withIdentifier: "ShowEventFromMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEventFromMap" {
            if let destinationVC = segue.destination as? ActivityViewController {
                destinationVC.idActualEvent = self.id
            }
        }
    }
    
    
}
