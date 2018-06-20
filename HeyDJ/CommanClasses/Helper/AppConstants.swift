//
//  AppConstants.swift
//  OnItsWayAgent
//
//  Created by OnItsWay Inc on 28/03/17.
//  Copyright © 2017 OnItsWay Inc. All rights reserved.
//

import Foundation
import UIKit

enum AppConstants{
    
static let AppName = "MyFirstApp"
static let NoInternetMessage = "Sorry! No internet connection"
static let UnderDevelopment = "Under Development"
static let Logout = "are you want to log in out?"

    
   static var appLightColor:UIColor{
    return UIColor(red: 81.0/255.0, green: 40.0/255.0, blue: 62.0/255.0, alpha: 1.0)
    }
    static var appColor:UIColor{
        return UIColor(red: 15.0/255.0, green: 31.0/255.0, blue: 39.0/255.0, alpha: 1.0)
    }

   }

//SAVE USER DEFAULTS 

enum UserDefaultsKey:String{
 case name = "name"
 case email = "email"
 case mobile = "mobile"
    
    
    // Development
    
        static let imageUrl = "http://onitsway.onsisdev.info/public/uploads/profile/"
    
    // live
    
//    static let imageUrl                  = "https://api.onitsway.com/uploads/profile/"
    
    
    
 case profilePic = "profilePic"
 case sessionToken = "sessionToken"
 case password = "password"
 case lattitude = "lattitude"
 case longitude = "longitude"
 case address = "address"
 case firstName = "firstName"
 case lastName = "lastName"
 case fullProfilePic = "fullPic"
 case deviceId = "deviceId"
 case deviceToken = "deviceToken"
 case userId = "userID"
 case company = "company"
 case countryCode = "countryCode"
 case carInsurance = "carInsurance"
 case carRegistration = "carRegistration"
 case mobileVerified = "mobileVerified"
 case city = "city"
 case region = "region"
 case country = "country"
 case emailVerified = "emailVerified"
 case driverLicense = "driverLicense"
 case pincode = "pincode"
 case heavyOversizedPackage = "heavyOversizedPackage"
 case customerId = "customerId"
 case touchIdEnabel = "touchIdEnabel"
 case allowPersontoPerson = "allowPersontoPerson"
 case customerChanel = "customerChanel"
 case OTP = "OTP"
    
    /////// 
    
 case personToPersonDeliveryAccept = "personToPersonDeliveryAccept" // for person to person delivery accept


}
