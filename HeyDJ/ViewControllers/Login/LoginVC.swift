//
//  LoginVC.swift
//  HeyDJ
//
//  Created by Pankajr on 21/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit
import Alamofire
import MICountryPicker

class LoginVC: UIViewController,MICountryPickerDelegate {
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var countryPickerBtn: UIButton!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
loginBtn.setButtonRadius()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countryPickerAction(_ sender: Any) {
        let picker = MICountryPicker()
        picker.delegate = self
        
        // Optionally, set this to display the country calling codes after the names
        picker.showCallingCodes = true
        navigationController?.present(picker, animated: true, completion: nil)
        
    }
    @IBAction func forgotPasswordAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signupBtnAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
        let reachabilityManager         = NetworkReachabilityManager()
        let reacabilitystatus           = reachabilityManager?.isReachable
        if(reacabilitystatus!){
            
            let registrationValidationObj   = RegistrationValidation()
            let message = registrationValidationObj.checkValidationForLogin(controller: self)
            
            if(message.count > 0){
                
                Globals.showAlert(message: message, controller: self)
                
            }
            else{
                
                loginWebService()
            }
            
            
            
            
            
        }
        else{
            
            Globals.showAlert(message: notConnetedToNetwork, controller: self)
        }
    }
    
    
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String) {
        print(code)
        
    }
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        print(dialCode)
        countryPickerBtn.setTitle(dialCode, for: .normal)
        navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
   
    
    // MARK:- Webservice Get Otp SignUp
    
    func loginWebService() {
    

        
         var params:[String:Any]            = [String:Any]()
        
                params[kdevice_id]         = UIDevice.current.identifierForVendor!.uuidString
                params[kdevice_token]      = UserDefaultController.sharedInstance.getDeviceToken()
                params[kdevice_type]       = DEVICE_TYPE
                params[kemail_or_phone]    = mobileTF.text
                params[kpassword]          = passwordTF.text
                params[kdebugMode]         = DEBUG_MODE
                params[kcountryCode]       = countryPickerBtn.titleLabel?.text
        
        SSCommonClass.showActivityIndicator(controller: self)
        
        AGWebServiceManager.sharedInstance.WebServiceLogin(params: params, success: { (response) in
            SSCommonClass.hideActivityIndicator()
            
            let status = response.response_status
            
            switch(status){
            case 0? :
                
                Globals.showAlert(message: response.response_msg!, controller: self)
                
            case 1? :
                
                
                UserDefaultController.sharedInstance.saveSessionToken(sessionToken: (response.response_data?.session_token!)!)
                UserDefaultController.sharedInstance.saveProfile(userProfile:(response.response_data?.profile)!)
                let pr =   UserDefaultController.sharedInstance.getUserProfile()
                
                print(pr)
                
                SharedAppDelegate.sendToHome()
                
            default:
                
                
                SSCommonClass.hideActivityIndicator()
                
                
            }
            
            
            
        }) { (error) in
            SSCommonClass.hideActivityIndicator()
        }
        
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
