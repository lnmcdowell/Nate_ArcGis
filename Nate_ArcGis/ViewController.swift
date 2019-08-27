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
    }
        //Add a basemap tiled layer
        private func setupMap() {
            mapView.map = AGSMap(basemapType: .navigationVector, latitude: 34.848741, longitude: -82.219049, levelOfDetail: 13)
        }
        //AGSServiceImageTiledLayer
    


}

