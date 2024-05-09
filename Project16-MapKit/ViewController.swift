//
//  ViewController.swift
//  Project16-MapKit
//
//  Created by Matteo Orru on 07/05/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -01.1274), info: "Home to the 2012 Summer Olympics.", wiki: "London")
        
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.", wiki: "Oslo")
        
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.", wiki: "Paris")
        
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 42.9, longitude: 12.5), info: "Has a whole country inside it.", wiki: "Rome")
        
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.", wiki: "Washington,_D.C.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
        setupRightBarButton()
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        //annotationView?.tintColor = .systemTeal
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let vc = DetailViewController()
        vc.capital = capital
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func setupRightBarButton() {
        let mapTypeIcon = UIImage(systemName: "map.fill")
        let mapTypeButton = UIBarButtonItem(image: mapTypeIcon, style: .plain, target: self, action: #selector(mapButtonTapped))
        navigationItem.rightBarButtonItem = mapTypeButton
    }
    
    
    @objc func mapButtonTapped() {
        let ac = UIAlertController(title: "Choose a Map Type", message: "", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Standard", style: .default) { [weak self] _ in
            self?.mapView.mapType = .standard
            self?.mapView.showsBuildings = true
        })
        ac.addAction(UIAlertAction(title: "Satellite", style: .default) { [weak self] _ in
            self?.mapView.mapType = .satellite
            self?.mapView.showsBuildings = true
        })
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default) { [weak self] _ in
            self?.mapView.mapType = .hybrid
            self?.mapView.showsBuildings = true
        })
        ac.addAction(UIAlertAction(title: "Close", style: .cancel))
        
        present(ac, animated: true)
    }
    
    
    
    
    
}

