//
//  AGWebServiceManager.swift
//  TravelClaimSwift
//
//  Created by Akash Gaur on 05/09/17.
//  Copyright © 2017 Appy pie. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

//:=========================================================================
//MARK:- ########## GLOABLE KEYS ###############
//:=========================================================================

let PROFILE_KEY = "profile_pic"
let kPOSTYellowCabURL = "https://bookings.way2cloud.verifone.com:8888/WhiskyService.svc/rest/"
let key = "GetVehicleRequirements"
let kGETurl = "https://bookings.way2cloud.verifone.com/ServiceAlfa.svc/rest/customershistoricaltrips?pageNumber=1&pageSize=20&companyId=163&fromDate=01%2F01%2F2016&toDate=08%2F08%2F2017&fromPhone=9685741236&toPhone=9685741236"
let kGetMultipartURL = "https://maps.googleapis.com/maps/api/geocode/json?address=256&components=administrative_area:NS%7Ccountry:CA&key=AIzaSyC1fO6VCCx5bZHebBlVWW8MNEt2kBTBov8"










class AGWebServiceManager: NSObject {
    
    //MARK:- ### SHARED INSTANCE OBJECT ###
    static let sharedInstance = AGWebServiceManager()
    private override init() {
        
    }
    
//:=========================================================================
//MARK:- ########## BLOCK INITIALIZATION ###############
//:=========================================================================
    
    internal typealias webServiceSuccessBlock = (_ JSON:JSON)->Void
    internal typealias webServiceFailBlock = (_ ERROR:NSError)->Void
    
    
    
//:=========================================================================
//MARK:- ############ CALL API USING BODY ##############
//:=========================================================================
    
    
    //MARK: YELLOWCAB REGISTRATION WEBSERVICE
    
// func WebServiceYEllowCabRegistration(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kPOSTYellowCabURL, methodName: key, param: params, success: { (JSON) in
//            success (JSON)
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
    
    
    //MARK: RIDE HISTORY WEBSERVICE
    
// func WebServiceForRIdeHistory(success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.GetRequest(url:kGETurl, methodName:"", success: { (JSON) in
//            success(JSON)
//        }) { (Error) in
//            failure(Error)
//        }
//    }
//
    
//:=========================================================================
//MARK:- ########### CALL API USING MULTIPART ###########
//:=========================================================================
    
    
    //MARK:- REGISTRATION SERVICE
    
//    func WebServiceRegistration(params:JSONDictionary, image :UIImage?,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//        AGWebServiceController.POSTRequestWithMultiPart(url:kBaseURL, method: ksignupMethodName, param: params, imageKey: PROFILE_KEY , image: image, addImageflag: true, success: { (JSON) in
//            success(JSON)
//        }) { (Error) in
//            failure(Error)
//        }
//    }
    
    
    //MARK:- Register SERVICE
    
//   func WebServiceRegisterWithImage(params:JSONDictionary, imageArr :[UIImage],success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//    AGWebServiceController.POSTRequestWithMultiPart(url:kBaseURL, method: ksignupMethod, param: params, imageKeyArr: [kprofile_pic], imageArr: imageArr, addImageflag: true, success: { (JSON) in
//
//
//
//        let status = JSON["response_key"].int
//        Utils.dismissProgress()
//        if(status != SESSION_NOT_EXIST){
//
//            success(JSON)
//        }else{
//
//            SharedAppDelegate.sendToLogin()
//
//        }
//
//        }) { (Error) in
//            failure(Error)
//        }
//    }
//
//    func WebServiceRegisterWithOutImage(params:JSONDictionary, imageArr :[UIImage],success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//        AGWebServiceController.POSTRequestWithMultiPart(url:kBaseURL, method: ksignupMethod, param: params, imageKeyArr: [], imageArr: imageArr, addImageflag: false, success: { (JSON) in
//
//
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//        }) { (Error) in
//            failure(Error)
//        }
//    }
//
//    //MARK:- EDIT PROFILE SERVICE
//
//    func WebServiceEditProfile(params:JSONDictionary, imageArr :[UIImage],success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//        AGWebServiceController.POSTRequestWithMultiPart(url:kBaseURL, method: keditprofileMethod, param: params, imageKeyArr: [kprofile_pic], imageArr: imageArr, addImageflag: true, success: { (JSON) in
//
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//        }) { (Error) in
//            failure(Error)
//        }
//    }
//
//
//    //MARK:- Get OTP SignUp SERVICE
//
//    func WebServiceGetOTPSignUp(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: ksendotpnormalsignupMethod, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//    //MARK:- POST LOGOUT SERVICE
//
//    func WebServiceLogout(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: klogoutMethod, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//    //MARK:- POST LOGOUT SERVICE
//
//    func WebServiceLogin(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kloginMethod, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//            success(JSON)
//        }else{
//
//            SharedAppDelegate.sendToLogin()
//
//        }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//    //MARK:- POST GENERATE OTP FORGOT SERVICE
//
//    func WebServiceGenerateOtpForgot(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kgenerateOTPForgotMethod, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//
//
//    //MARK:- POST VERIFY OTP FORGOT SERVICE
//
//    func WebServiceVerifyOtpForgot(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kverifyOTPForgotMethod, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//    //MARK:- POST RESET PASSWORD SERVICE
//
//    func WebServiceResetPassword(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kresetPasswordMethod, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//    //MARK:- POST FARE CALCULATER SERVICE
//
//    func WebServiceFareCalculater(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kfareCalculater, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//    //MARK:- POST OFFER SERVICE
//
//    func WebServiceOffer(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kgetHomeBanner, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//     //MARK:- POST SEND REQUEST SERVICE
//
//    func WebServiceSendRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: ksendrequest, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//
//    //MARK:- POST GET HOME DATA SERVICE
//
//    func WebServiceGetHomeData(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kgethomedata, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//    //MARK:- POST GET APPOINTMENT SERVICE
//
//    func WebServiceGetAppointment(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kgetappointment, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//
//
//
//    //MARK:- POST CANCEL REQUEST SERVICE
//
//    func WebServiceCancelRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kcancelrequest, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//
//    //MARK:- POST HISTORY SERVICE
//
//    func WebServiceHistoryRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: khistory, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//    //MARK:- POST FEEDBACK SERVICE
//
//    func WebServiceFeedbackRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: ksendfeedback, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//
//    //MARK:- POST CHANGE PASSWORD SERVICE
//
//    func WebServiceChangePasswordRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kchangepassword, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//    //MARK:- POST PROMOTIONAL LIST SERVICE
//
//    func WebServicePromotionalListRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kgetPromocodeList, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//    //MARK:- POST VALIDATE PROMOCODE SERVICE
//
//    func WebServiceValidatePromocodeRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kcheckpromocode, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//    //MARK:- POST PAGES SERVICE
//
//    func WebServicePagesRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kpages, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
//
//
//     //MARK:- GET DISTANCE FROM GOOGLE API
//
//    func WebServiceGetDistance(UrlString : String,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//        AGWebServiceController.GetRequestDistance(url: UrlString, success: { (JSON) in
//             success(JSON)
//        }) { (Error) in
//            failure(Error)
//        }
//
//
//    }
//
//
//
//
//    func WebServiceMembershipDetailsRequest(params:JSONDictionary,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//
//        AGWebServiceController.POSTRequest(url: kBaseURL, methodName: kgetMembershipListing, param: params, success: { (JSON) in
//            let status = JSON["response_key"].int
//            Utils.dismissProgress()
//            if(status != SESSION_NOT_EXIST){
//
//                success(JSON)
//            }else{
//
//                SharedAppDelegate.sendToLogin()
//
//            }
//
//
//        }) { (Error) in
//            failure(Error)
//        }
//
//    }
    
    
    
    
    //MARK:- GET LAT/LONG FROM GOOGLE API
    
//    func WebServiceForGetLatLong(success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//        AGWebServiceController.GETRequestWithMultiPart(url:kGetMultipartURL , method: "", success: { (JSON) in
//            success(JSON)
//        }) { (Error)
//            failure(Error)
//        }
//
//    }
    


}
