//
//  RegistrationValidation.swift
//  TaxiShake
//
//  Created by admin on 05/12/17.
//  Copyright © 2017 ONS. All rights reserved.
//

import Foundation
import UIKit

class RegistrationValidation {
    let mandetoryloginfieldStrings = "All fields are mandatory."
    let mandetoryfieldStrings = "All fields are mandatory except referal code."
    let mobileNotValidStrings = "Please enter valid mobile number."
    let emailNotValidStrings = "Please enter valid email Address."
    let passwordNotValidStrings = "Please enter valid password,password must contains minimum 8 character."
    let passwordNotMatchStrings = "Password and confirm password not match."
    let T_and_C_Strings = "Please accepts terms and conditions to continue."
    
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValidPassword(password : String) -> Bool {
        return(password.count < 8) ? true : false
    }
    
    func isValidMobile(mobile : String) -> Bool {
        
        return (mobile.count >= 6 && mobile.count <= 14) ? false : true;
    }
    
    func checkValidationSignUp(controller: SignUpVC) -> String {
        if(controller.nameTF.text?.count == 0 || controller.mobileTF.text?.count == 0 || controller.emailTF.text?.count == 0 || controller.passwordTF.text?.count == 0){
            
            return mandetoryfieldStrings
        }
        else if(isValidMobile(mobile: controller.mobileTF.text!)){
            
            return mobileNotValidStrings
            
        }
        else if(!isValidEmail(email: controller.emailTF.text!)){
            
            return emailNotValidStrings
        }
        else if (isValidPassword(password: controller.passwordTF.text!)){
            return passwordNotValidStrings
        }
      
        else if (!controller.checkBoxBtn.isSelected){
            
            return T_and_C_Strings
        }
        else{
            
            return ""
        }
        
        
    }
//
//    func checkValidationEditProfile(controller: EditProfileVC) -> String {
//        if(controller.nameTF.text?.count == 0 || controller.mobileTF.text?.count == 0 || controller.emailTF.text?.count == 0){
//            
//            return mandetoryloginfieldStrings
//        }
//        else if(isValidMobile(mobile: controller.mobileTF.text!)){
//            
//            return mobileNotValidStrings
//            
//        }
//        else if(!isValidEmail(email: controller.emailTF.text!)){
//            
//            return emailNotValidStrings
//        }
//        else{
//            
//            return ""
//        }
//        
//        
//    }
//    
//    
//    func checkValidationForLogin(controller: LoginVC) -> String {
//        if(controller.emailTF.text?.count == 0 || controller.passwordTF.text?.count == 0){
//            
//            return mandetoryloginfieldStrings
//        }
//        else if(!isValidEmail(email: controller.emailTF.text!)){
//            
//            return emailNotValidStrings
//        }
//        else if (isValidPassword(password: controller.passwordTF.text!)){
//            return passwordNotValidStrings
//        }
//        else{
//            
//            return ""
//        }
//        
//        
//        
//    }
//    
//    func checkValidationForgotPass(controller: ForgotPasswordVC) -> String {
//        if(controller.emailTF.text?.count == 0){
//            
//            return mandetoryloginfieldStrings
//        }
//        else if(!isValidEmail(email: controller.emailTF.text!)){
//            
//            return emailNotValidStrings
//        }
//        else{
//            
//            return ""
//        }
//        
//        
//        
//    }
//    
//    func checkValidationForResetPass(controller: ResetPasswordVC) -> String {
//        if(controller.passwordTF.text?.count == 0 || controller.confirmPassTF.text?.count == 0){
//            
//            return mandetoryloginfieldStrings
//        }
//        else if (isValidPassword(password: controller.passwordTF.text!)){
//            return passwordNotValidStrings
//        }
//        else if (controller.passwordTF.text != controller.confirmPassTF.text){
//            
//            return passwordNotMatchStrings
//        }
//        else{
//            
//            return ""
//        }
//        
//        
//    }
//    
//    
//    func checkValidationForChangePass(controller: ChangedPasswordVC) -> String {
//        if(controller.newPasswordTF.text?.count == 0 || controller.confirmPasswordTF.text?.count == 0 || controller.oldPasswordTF.text?.count == 0 ){
//            
//            return mandetoryloginfieldStrings
//        }
//        else if (isValidPassword(password: controller.oldPasswordTF.text!)){
//            return passwordNotValidStrings
//        }
//        else if (isValidPassword(password: controller.newPasswordTF.text!)){
//            return passwordNotValidStrings
//        }
//        else if (controller.newPasswordTF.text != controller.confirmPasswordTF.text){
//            
//            return passwordNotMatchStrings
//        }
//        else{
//            
//            return ""
//        }
//        
//        
//    }
    
    
}

