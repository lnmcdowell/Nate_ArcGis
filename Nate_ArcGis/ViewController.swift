//
//  ViewController.swift
//  Nate_ArcGis
//
//  Created by Nathaniel Mcdowell on 8/27/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit
import ArcGIS

class ViewController: UIViewController {

    
    @IBOutlet weak var mapView: AGSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMap()
        setupButtons()
    }
        //Add a basemap tiled layer
        private func setupMap() {
            
            mapView.map = AGSMap(basemapType: .navigationVector, latitude: 34.848741, longitude: -82.219049, levelOfDetail: 13)
            
            //mapView.map = AGSMap(basemapType: .terrainWithLabels, latitude: 34.848741, longitude: -82.219049, levelOfDetail: 13)
            let mycenter = AGSPoint(clLocationCoordinate2D: CLLocationCoordinate2D(latitude: 34.848741, longitude: -82.219048))
        
         //   mapView.setViewpointCenter(<#T##center: AGSPoint##AGSPoint#>, scale: <#T##Double#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
            
            let envelope = AGSEnvelope(xMin: -124.83145667, yMin: 30.49849464, xMax: -113.91375495,  yMax: 44.69150688,  spatialReference: mapView.spatialReference)
            //self.mapView.zoomToEnvelope(envelope, animated: true)
           
            //mapView.setViewpointCenter(mycenter, completion: {(complete) in print("Hi")})
            let url = URL(string: "https://services6.arcgis.com/ssFJjBXIUyZDrSYZ/arcgis/rest/services/Class_Airspace/FeatureServer/0")
            
            let faatable = AGSServiceFeatureTable(url: url!)
            let layer = AGSFeatureLayer(featureTable: faatable)
            mapView.map?.operationalLayers.add(layer)
            
            
        }
        //AGSServiceImageTiledLayer
    
    func setupButtons(){
    let sB = UIButton()
        sB.setTitle("Zoom IN", for: .normal)
        sB.backgroundColor = .green
        sB.titleLabel?.textColor = .white
        sB.layer.cornerRadius = 10
        sB.layer.borderWidth = 2
        sB.layer.borderColor = UIColor.black.cgColor
        sB.addTarget(self, action: #selector(changeIt), for: .touchUpInside)
        //sB.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
        self.mapView.addSubview(sB)
        sB.translatesAutoresizingMaskIntoConstraints = false
        sB.topAnchor.constraint(equalTo: mapView.topAnchor).isActive = true
        sB.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sB.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //sB.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 200).isActive = true
        sB.centerXAnchor.constraint(equalTo: mapView.centerXAnchor, constant: 0).isActive = true
        
        let sBO = UIButton()
        sBO.setTitle("Zoom Out", for: .normal)
        sBO.backgroundColor = .red
        sBO.titleLabel?.textColor = .white
        sBO.layer.cornerRadius = 10
        sBO.layer.borderWidth = 2
        sBO.layer.borderColor = UIColor.black.cgColor
        sBO.addTarget(self, action: #selector(zoomOut), for: .touchUpInside)
        //sB.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
        self.mapView.addSubview(sBO)
        sBO.translatesAutoresizingMaskIntoConstraints = false
        sBO.topAnchor.constraint(equalTo: mapView.topAnchor).isActive = true
        sBO.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sBO.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sBO.leadingAnchor.constraint(equalTo: sB.trailingAnchor, constant: 10).isActive = true
       // sBO.centerXAnchor.constraint(equalTo: mapView.centerXAnchor, constant: 0).isActive = true
    }
    
    @objc func changeIt(sender:UIButton){
        let currentScale = self.mapView.mapScale
        let targetScale = currentScale / 5 //zoom in
        let currentCenter = self.mapView.visibleArea!.extent.center
        self.mapView.setViewpoint(AGSViewpoint(center: currentCenter, scale: targetScale), duration: 2, curve: AGSAnimationCurve.easeInOutSine) { (finishedWithoutInterruption) in
//            if finishedWithoutInterruption {
//                self.mapView.setViewpoint(AGSViewpoint(center: currentCenter, scale: currentScale), duration: 2, curve: .easeInOutSine)
//            }
        }
    }
    @objc func zoomOut(sender:UIButton){
        let currentScale = self.mapView.mapScale
        let targetScale = currentScale * 5 //zoom in
        let currentCenter = self.mapView.visibleArea!.extent.center
        self.mapView.setViewpoint(AGSViewpoint(center: currentCenter, scale: targetScale), duration: 2, curve: AGSAnimationCurve.easeInOutSine) { (finishedWithoutInterruption) in
            //            if finishedWithoutInterruption {
            //                self.mapView.setViewpoint(AGSViewpoint(center: currentCenter, scale: currentScale), duration: 2, curve: .easeInOutSine)
            //            }
        }
    }
}

