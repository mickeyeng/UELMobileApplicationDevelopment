//
//  ViewControllerCinema.swift
//  myMovie2
//
//  Created by Mickey English on 26/03/2018.
//  Copyright © 2018 Mickey English. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerCinema: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func greenwichButton(_ sender: UIButton) {
        
        // defiing greenwich cinema destination
        let latitude:CLLocationDegrees = 51.490800
        let longitude:CLLocationDegrees = 0.012775
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        
//        set region of the map
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Greenwich Odeon"
        mapItem.openInMaps(launchOptions: options)
        
        
        
        
    }
    
    @IBAction func backToMenuButton(_ sender: UIButton) {
         performSegue(withIdentifier: "segueMenu", sender: self)
    }
    
    
    
    
    @IBAction func tableViewBtb(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToTable", sender: self)
    }
    
    
}
