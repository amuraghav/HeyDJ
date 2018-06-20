
//
//  AppLocationManager.swift
//  Global GS
//
//  Created by OnItsWay Inc  on 23/01/17.
//  Copyright © 2017 OnItsWay. All rights reserved.
//

import Foundation
import CoreLocation
//import GooglePlaces

let SharedLocationManager = SSLocationManager.sharedLocationManager

class SSLocationManager : NSObject, CLLocationManagerDelegate {

    static let sharedLocationManager = SSLocationManager()
    
    private var locationUpdateCompletion : ((CLLocation)->Void)?
    private var fetchingLocation : ((Bool) -> Void)?
    private let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    var myLocation   = CLLocation()
//    var currentPlace =  GMSPlacesClient()

    var address : String?

    var locationsEnabled : Bool {
        
        if( CLLocationManager.locationServicesEnabled() &&
            CLLocationManager.authorizationStatus() != CLAuthorizationStatus.denied) {
                
                return true
                
        } else {
            
            return false
        }
        
    }
    
   
    
    init(currentLocation:CLLocation) {
        self.myLocation  = currentLocation
    }
    
    
    override init() {

        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.distanceFilter = 10.0
    }
    
    func updateCurrentLocation(startUpdatingLocation : @escaping ((Bool) -> Void),completion : @escaping (CLLocation)->Void) {
    
        if self.locationsEnabled {
            startUpdatingLocation(true)
            self.fetchingLocation = startUpdatingLocation
            self.locationUpdateCompletion = completion
            self.locationManager.startUpdatingLocation()
        } else {
            startUpdatingLocation(false)        
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
//        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        fetchingLocation!(true)
        self.currentLocation = manager.location
        self.locationUpdateCompletion?(locations.last!)
        self.locationManager.stopUpdatingLocation()
    }
    
    typealias callbackPlacemark = (_ placemark:[CLPlacemark]?)->Void
     typealias callbackError = (_ placemark:Error?)->Void

    func getGeoAddressFromLocation(location:CLLocation?,completionHandler:@escaping callbackPlacemark,errorBlock:@escaping callbackError){
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location!) { (placemark, error) in
            if let error =  error{
               errorBlock(error)
            }
            else{
            completionHandler(placemark)
            
            }
            
        }
    }
    
}
        
//            if error == nil && placemarks.count > 0 {
//                self.placeMark = placemarks.last as? CLPlacemark
//                self.adressLabel.text = "\(self.placeMark!.thoroughfare)\n\(self.placeMark!.postalCode) \(self.placeMark!.locality)\n\(self.placeMark!.country)"
//                self.manager.stopUpdatingLocation()
//
