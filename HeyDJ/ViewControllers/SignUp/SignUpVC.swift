//
//  SignUpVC.swift
//  HeyDJ
//
//  Created by Pankajr on 20/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit
import MICountryPicker
import Alamofire

class SignUpVC: UIViewController,MICountryPickerDelegate {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var checkBoxBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var countryPickerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      signupBtn.setButtonRadius()
        checkBoxBtn.isSelected = false
       
        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
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
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String) {
        print(code)
        
    }
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        print(dialCode)
        countryPickerBtn.setTitle(dialCode, for: .normal)
        navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    func getOtpWebService() {
 

        var paramsForSignUp:[String:Any]            = [String:Any]()
      
        paramsForSignUp[kdevice_id]         = UIDevice.current.identifierForVendor!.uuidString
        paramsForSignUp[kdevice_token]      = UserDefaultController.sharedInstance.getDeviceToken()
        paramsForSignUp[kdevice_type]       = DEVICE_TYPE
        paramsForSignUp[kemail]             = emailTF.text
        paramsForSignUp[kmobile]            = mobileTF.text
        paramsForSignUp[kname]              = nameTF.text
        paramsForSignUp[kpassword]          = passwordTF.text
        paramsForSignUp[kdebugMode]         = DEBUG_MODE
        paramsForSignUp[kcountryCode]       = countryPickerBtn.titleLabel?.text

        let params :[String : Any] =
            [
                kcountryCode                    : countryPickerBtn.titleLabel?.text ?? "+91",
                kmobile                         : mobileTF.text ?? ""

        ]
       SSCommonClass.showActivityIndicator(controller: self)

        AGWebServiceManager.sharedInstance.WebServiceGetOTPSignUp(params: params, success: { (response) in
            SSCommonClass.hideActivityIndicator()

            let status = response.response_status

            switch(status){
            case 0? :

                Globals.showAlert(message: response.response_msg!, controller: self)

            case 1? :
//                Globals.showAlert(message: response.response_msg!, controller: self)
                let mobileVerificationVC           = mainStoryboardObj.instantiateViewController(withIdentifier: "MobileVerificationVC") as! MobileVerificationVC

                mobileVerificationVC.signUpParameters     = paramsForSignUp
                mobileVerificationVC.isFromSignUp  = true
                mobileVerificationVC.mobileOTP = response.response_data?.sms_otp
                self.navigationController?.pushViewController(mobileVerificationVC, animated: true)



            default:


                SSCommonClass.hideActivityIndicator()


            }



        }) { (error) in
            SSCommonClass.hideActivityIndicator()
        }




    }
    @IBAction func signupBtnAction(_ sender: Any) {
        
        let reachabilityManager         = NetworkReachabilityManager()
        let reacabilitystatus           = reachabilityManager?.isReachable
        if(reacabilitystatus!){
            let registrationValidationObj   = RegistrationValidation()
            let message = registrationValidationObj.checkValidationSignUp(controller: self)


        if(message.count > 0){

            Globals.showAlert(message: message, controller: self)

        }
        else{

            getOtpWebService()
        }
        }
        else{

            Globals.showAlert(message: notConnetedToNetwork, controller: self)
        }
    }
    
    @IBAction func checkBoxBtnAction(_ sender: Any) {
        
        checkBoxBtn.isSelected = (checkBoxBtn.isSelected) ? false : true
 
    }
    @IBAction func termCondiBtnAction(_ sender: Any) {
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
