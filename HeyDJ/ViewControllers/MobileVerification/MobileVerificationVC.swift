//
//  MobileVerificationVC.swift
//  HeyDJ
//
//  Created by Pankajr on 21/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit
import Alamofire

class MobileVerificationVC: UIViewController {
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    var signUpParameters : [String : Any]?
    var isFromSignUp : Bool!
    var mobileOTP : String?
    @IBOutlet weak var OTPTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verifyBtn.setButtonRadius()
        textLabel.text = (isFromSignUp)! ? signupMobileVerifyString : forgotPasswordMobileVerifyString
        rightImageView.isHidden = (isFromSignUp)! ? true : false
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func backBtnAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verifyBtnAction(_ sender: Any) {
        
        let reachabilityManager         = NetworkReachabilityManager()
        let reacabilitystatus           = reachabilityManager?.isReachable
        if(reacabilitystatus!){
            let isOTPMatched = (OTPTextField.text == self.mobileOTP)
            if(isOTPMatched){
                
                if(isFromSignUp){
                    
                    webserviceForSignUp()
                }
                else{
                    
                    
                }
                
                
                
            }else{
                
                Globals.showAlert(message: OTPError, controller: self)
            }
            
            
        }
        else{
            
            Globals.showAlert(message: notConnetedToNetwork, controller: self)
        }
        
        
        
        
//
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
//
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func resendBtnAction(_ sender: Any) {
        
        let reachabilityManager         = NetworkReachabilityManager()
        let reacabilitystatus           = reachabilityManager?.isReachable
        if(reacabilitystatus!){
           
                
                getOtpWebService()
            
        }
        else{
            
            Globals.showAlert(message: notConnetedToNetwork, controller: self)
        }
    }
    
    
    
    
    func getOtpWebService() {
        
        let params :[String : Any] =
            [
                kcountryCode                    : signUpParameters!["country_code"] as! String ,
                kmobile                         : signUpParameters!["mobile"] as! String
                
        ]
        SSCommonClass.showActivityIndicator(controller: self)
        
        AGWebServiceManager.sharedInstance.WebServiceGetOTPSignUp(params: params, success: { (response) in
            SSCommonClass.hideActivityIndicator()
            
            let status = response.response_status
            
            switch(status){
            case 0? :
                
                Globals.showAlert(message: response.response_msg!, controller: self)
                
            case 1? :
            
                self.mobileOTP = response.response_data?.sms_otp

            default:
                
                
                SSCommonClass.hideActivityIndicator()
                
                
            }
            
            
            
        }) { (error) in
            SSCommonClass.hideActivityIndicator()
        }
        
        
        
        
    }
    
    func webserviceForSignUp() {
        SSCommonClass.showActivityIndicator(controller: self)
        
        AGWebServiceManager.sharedInstance.WebServiceSignUp(params: signUpParameters!, success: { (response) in
            SSCommonClass.hideActivityIndicator()
            
            let status = response.response_status
            
            switch(status){
            case 0? :
                
                Globals.showAlert(message: response.response_msg!, controller: self)
                
            case 1? :
                
//                let session = responseDict!["response_data"]!["session_token"].string
//                let profile = responseDict!["response_data"]!["user_profile"].dictionaryObject
                
                
                
//                UserDefaultController.sharedInstance.saveEmail(email: self.emailTF.text!)
                UserDefaultController.sharedInstance.saveSessionToken(sessionToken: (response.response_data?.session_token!)!)
                UserDefaultController.sharedInstance.saveProfile(userProfile:(response.response_data?.profile)!)
             let pr =   UserDefaultController.sharedInstance.getUserProfile()
                print(pr)
                
                self.navigationController?.popToRootViewController(animated: true)
                
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
