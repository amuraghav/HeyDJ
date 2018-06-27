//
//  ForgotPasswordVC.swift
//  HeyDJ
//
//  Created by Pankajr on 21/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit
import MICountryPicker
import Alamofire

class ForgotPasswordVC: UIViewController,MICountryPickerDelegate {

    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var countryPickerBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
submitBtn.setButtonRadius()
        self.navigationController?.navigationBar.backItem?.title = nil
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Country Picker Deligate
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String) {
        print(code)
        
    }
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        print(dialCode)
        countryPickerBtn.setTitle(dialCode, for: .normal)
        navigationController?.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func countryPickerAction(_ sender: Any) {
        
        let picker = MICountryPicker()
        picker.delegate = self
        
        // Optionally, set this to display the country calling codes after the names
        picker.showCallingCodes = true
        navigationController?.present(picker, animated: true, completion: nil)
    }
    
    
    
    // MARK:- Submit Button Action
    
    @IBAction func submitBtnAction(_ sender: Any) {
        
        
        
        let reachabilityManager         = NetworkReachabilityManager()
        let reacabilitystatus           = reachabilityManager?.isReachable
        if(reacabilitystatus!){
            
            let registrationValidationObj   = RegistrationValidation()
            let message = registrationValidationObj.checkValidationForgotPass(controller: self)
            
            if(message.count > 0){
                
                Globals.showAlert(message: message, controller: self)
                
            }
            else{
                
                getForgotPasswordService()
            }
            
            
            
          
        }
        else{
            
            Globals.showAlert(message: notConnetedToNetwork, controller: self)
        }
        
        

    }
    
    
    
    
    
    
    
    
    func getForgotPasswordService() {
        
        let params :[String : Any] =
            [
                kcountryCode                    : countryPickerBtn.titleLabel?.text ?? "" ,
                kmobile                         : mobileNumberTF.text ?? ""
                
        ]
        SSCommonClass.showActivityIndicator(controller: self)
        
        AGWebServiceManager.sharedInstance.WebServiceGenerateOtpForgot(params: params, success: { (response) in
            SSCommonClass.hideActivityIndicator()
            
            let status = response.response_status
            
            switch(status){
            case 0? :
                
                Globals.showAlert(message: response.response_msg!, controller: self)
                
            case 1? :
                
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MobileVerificationVC") as! MobileVerificationVC
                        vc.isFromSignUp = false
                        vc.mobileOTP  = response.response_data?.sms_otp
                        vc.signUpParameters = params
                
                        self.navigationController?.pushViewController(vc, animated: true)

                
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
