//
//  UserDefaultController.swift
//  TaxiShake
//
//  Created by admin on 05/12/17.
//  Copyright © 2017 ONS. All rights reserved.
//

import UIKit

class UserDefaultController: NSObject {
    static let sharedInstance = UserDefaultController()
    private let userDefault : UserDefaults = UserDefaults.standard
    
    
    func saveDeviceToken(deviceToken : String) {
        userDefault.setValue(deviceToken, forKey: DEVICE_TOKEN)
    }
    
    func saveSessionToken(sessionToken : String) {
        userDefault.setValue(sessionToken, forKey: SESSION_TOKEN)
    }
    
    
    func saveProfile(userProfile : [String:Any]) {
        let profileData: Data = NSKeyedArchiver.archivedData(withRootObject: userProfile )
        userDefault.setValue(profileData, forKey: USER_PROFILE)
    }
    
    func saveCarTypeArr(carTypeArr : [String:Any]) {
        let carTypeData: Data = NSKeyedArchiver.archivedData(withRootObject: carTypeArr )
        userDefault.setValue(carTypeData, forKey: CAR_TYPES)
    }
    
    
    func getDeviceToken() -> String {
        let result  = userDefault.string(forKey: DEVICE_TOKEN)
        return (result != nil) ? result! : ""
    }
    
    func getSessionToken() -> String {
        let result  = userDefault.string(forKey: SESSION_TOKEN)
        return (result != nil) ? result! : ""
    }
    
    func saveEmail(email : String) {
        userDefault.setValue(email, forKey: EMAIL)
    }
    func getEmail() -> String {
        let result  = userDefault.string(forKey: EMAIL)
        return (result != nil) ? result! : ""
    }
    
    func getUserProfile() -> [String:Any] {
        let result  = userDefault.object(forKey: USER_PROFILE) as? Data
        if(result != nil){
            
            return NSKeyedUnarchiver.unarchiveObject(with: result!) as! [String : Any]
        }
        else{
            return [:]
        }
        
        
    }
    
    func getCarTypes() -> [String:Any] {
        let result  = userDefault.object(forKey: CAR_TYPES) as? Data
        if(result != nil){
            
            return NSKeyedUnarchiver.unarchiveObject(with: result!) as! [String : Any]
        }
        else{
            return [:]
        }
        
        
    }

}
