//
//  ResetPasswordVC.swift
//  HeyDJ
//
//  Created by Pankajr on 21/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit
import Alamofire

class ResetPasswordVC: UIViewController {
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    var mobileNumber : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
submitBtn.setButtonRadius()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitBtnAction(_ sender: Any) {
        
        let reachabilityManager         = NetworkReachabilityManager()
        let reacabilitystatus           = reachabilityManager?.isReachable
        if(reacabilitystatus!){
            
            let registrationValidationObj   = RegistrationValidation()
            let message = registrationValidationObj.checkValidationForChangePass(controller: self)
            
            if(message.count > 0){
                
                Globals.showAlert(message: message, controller: self)
                
            }
            else{
                
               changePasswordWebService()
            }
            
          
            
            
            
        }
        else{
            
            Globals.showAlert(message: notConnetedToNetwork, controller: self)
        }
    }
    
    
    
    // MARK:- Webservice Get Otp SignUp
    
    func changePasswordWebService() {
        
        let params :[String : Any] =
            [
                kpassword                    : self.newPasswordTF.text!,
                kmobile                      : self.mobileNumber ?? ""
                
        ]
        SSCommonClass.showActivityIndicator(controller: self)
        
        AGWebServiceManager.sharedInstance.WebServiceChangePasswordRequest(params: params, success: { (response) in
            SSCommonClass.hideActivityIndicator()
            
            let status = response.response_status
            
            switch(status){
            case 0? :
                
                Globals.showAlert(message: response.response_msg!, controller: self)
                
            case 1? :
                
                
                self.navigationController?.popToRootViewController(animated: true)
                Globals.showAlert(message: response.response_msg!, controller: self)
                
            default:
                
                
                SSCommonClass.hideActivityIndicator()
                
                
            }
            
            
            
        }) { (error) in
            SSCommonClass.hideActivityIndicator()
        }
        
        
        
        
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
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

}
