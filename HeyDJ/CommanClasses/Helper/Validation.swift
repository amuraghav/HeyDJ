//
//  Validation.swift
//  StandridgeApp
//
//  Created by admin on 20/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
import  UIKit


let REGEX_USER_NAME_LIMIT  = "^.{3,10}$"
let REGEX_USER_NAME  = "[A-Za-z0-9]{3,10}"
let REGEX_EMAIL  = "[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
let REGEX_PASSWORD_LIMIT  = "^.{6,20}$"
let REGEX_PASSWORD  = "[A-Za-z0-9]{6,20}"
let REGEX_PHONE_DEFAULT  = "[0-9]{3}\\-[0-9]{3}\\-[0-9]{4}"

class Validation {
    
    // MARK: - validationName
    class func validationName(_ checkString: String) -> Bool {
        
//        do
//        {
//            let regex = try NSRegularExpression(pattern: "^[0-9a-zA-Z\\_]{7,18}$", options: .caseInsensitive)
//            if regex.matches(in: checkString, options: [], range: NSMakeRange(0, checkString.characters.count)).count > 0 {
//                return true
//            }
//        }
//        catch {
//            
//        }
//        return false

        if checkString.characters.count < 35 && checkString.characters.count > 0{
            return true
            
        }
        return false
        
    }
    
    
    //MARK:- validateEmail
    class func validateEmail(email : String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if email.characters.count == 0
        {
            return false
        }
            
        else if !emailTest.evaluate(with: email)
        {
            return false
        }
            
        else
        {
            return true
        }
    }
    
    
    
    
    
    
    // MARK: - validateMobileNumber
    class func validateMobileNumber(_ number: String) -> Bool {
        let numberRegEx = "[0-9]{6,14}"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        if numberTest.evaluate(with: number) == true {
            return true
        }
        else {
            return false
        }
    }
    }
    

