//
//  CLLocation+Address.swift
//  PrintsturCustomer
//
//  Created by OnItsWay Inc on 27/02/17.
//  Copyright © 2017 AppPie. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocation {
    
    func convertToAddress(completion : @escaping (String) -> Void,timeZoneCompletion:@escaping (String)->Void) {
        
        self.convertToPlaceMark { (placemark : CLPlacemark) -> Void in
            
            // Address dictionary
            // Location name
            let pincode = (placemark.addressDictionary!["Name"] as? String) ?? "" //pincode
            
            // Street address
            let street = (placemark.addressDictionary!["Thoroughfare"] as? String) ?? (placemark.addressDictionary!["SubLocality"] as? String) ?? "" //Sector
            // City
            let city = (placemark.addressDictionary!["City"] as? String) ?? ""
            let state = (placemark.addressDictionary!["State"] as? String) ?? (placemark.addressDictionary!["Country"] as? String) ?? ""
            //  let zip = (placeMark.addressDictionary!["ZIP"] as? String) ?? ""
            
            //            let country = (placemark.addressDictionary!["Country"] as? String) ?? ""
            
            let address =  street + ", " + city + ", " + state + ", "  + pincode //+ country
            completion(address)
            if #available(iOS 9.0, *) {
                if let timeZone = placemark.timeZone?.identifier {
                    timeZoneCompletion(timeZone)
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    func convertToPlaceMark(completion : @escaping (CLPlacemark) -> Void) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(self,
                                        
                                        completionHandler: { (placemarks, error) -> Void in
                                            
                                            if placemarks != nil {
                                                
                                                let placeArray = placemarks! as [CLPlacemark]
                                                
                                                let placeMark: CLPlacemark! = placeArray[0]
                                                
                                                completion(placeMark)
                                                
                                            }
        })
    }
    
}


