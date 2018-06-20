//
//  Constants.swift
//  TaxiShake
//
//  Created by admin on 17/11/17.
//  Copyright © 2017 ONS. All rights reserved.
//

import Foundation
import UIKit

let mainStoryboardObj = UIStoryboard(name: "Main", bundle: nil)
let SCREEN_WIDTH            = UIScreen.main.bounds.width
let SCREEN_HEIGHT           = UIScreen.main.bounds.height
let navigationBarColor      = UIColor(red: 246.0/255.0, green: 141.0/255.0, blue: 32.0/255.0, alpha: 1.0)
let cellUnselectedColor     = UIColor(red: 61.0/255.0, green: 61.0/255.0, blue: 61.0/255.0, alpha: 1.0)
let DEVICE_TYPE             = "2"
let LANGUAGE                = "en"
let DEBUG_MODE              = "2"  // 1 development , 2 production
let kGoogleMapKey           = "AIzaSyBjzO7sODxSO29JyzLn_RBMH-K2bkjpid8"//For Maps
let kGoogleDirectionKey     = "AIzaSyC8Wp93bbMkFMa4g6_Zy6Rrc9UIHM7zA2M" // for distance and time
let SERVER_CHANNEL          = "taxishake"
let SESSION_NOT_EXIST       = 8

//Ride Status


let ACCEPT                  = 5
let NEW_BOOKING             = 6
let ARRIVED                 = 4
let CANCEL                  = 9
let BEGIN_TRIP              = 3
let DROPPED                 = 2


//Development
//let kBaseURL                    = "http://taxishake.onsisdev.info/passengerapi/"
//let kImageDriverURL             = "http://taxishake.onsisdev.info/public/media/driver/"
//let kImagePassengerURL          = "http://taxishake.onsisdev.info/public/media/passenger/"
//let kVehicleTypeBaseURL         = "http://taxishake.onsisdev.info/public/media/vehicletypefare/"
//let PUBNUB_PUBLISH_KEY          = "pub-c-f3cb5c10-ac1b-402d-9574-03155372ee85"
//let PUBNUB_SUBSCRIBE_KEY        = "sub-c-32ecad3a-dbfc-11e7-a9ef-2291f454b5f8"



//Live
let kBaseURL                    = "http://35.173.154.15/admin/passengerapi/"
let kImageDriverURL             = "http://35.173.154.15/admin/public/media/driver/"
let kImagePassengerURL          = "http://35.173.154.15/admin/public/media/passenger/"
let kVehicleTypeBaseURL         = "http://35.173.154.15/admin/public/media/vehicletypefare/"
let PUBNUB_PUBLISH_KEY          = "pub-c-ace93a61-25a8-4969-8f6e-5f2b660d1ebb"
let PUBNUB_SUBSCRIBE_KEY        = "sub-c-59f7e240-1cfd-11e8-97e5-2e7e45341bc1"


//App Services

let kloginMethod                  = "login"
let ksignupMethod                 = "signup"
let ksendotpnormalsignupMethod    = "sendotpnormalsignup"
let klogoutMethod                 = "logout"
let kgenerateOTPForgotMethod      = "generateforgortotp"
let kverifyOTPForgotMethod        = "checkotp"
let kresetPasswordMethod          = "resetpassword"
let kfareCalculater               = "farecalculator"
let ksendrequest                  = "sendrequest"
let kgethomedata                  = "gethomedata"
let kgetappointment               = "getappointment"
let kcancelrequest                = "cancelrequest"
let keditprofileMethod            = "editprofile"
let khistory                      = "history"
let ksendfeedback                 = "sendfeedback"
let kpages                        = "pages"
let kchangepassword               = "changepassword"
let kgetPromocodeList             = "getPromocodeList"
let kcheckpromocode               = "checkpromocode"
let kgetHomeBanner                = "getHomeBanner"
let kgetMembershipListing          = "getMembershipListing"



//messages
let notConnetedToNetwork         = "Sorry,Unable to process you are not connected to Internet."
let reviewTextFieldPlaceholder         = "Please share your experience with us, it will help us provide us better service."






//MARK:======= REGISTER & LOGIN PARAMETER KEY =====

let kemail                      = "email"
let kmobile                     = "mobile"
let kdevice_id                  = "device_id"
let kdevice_token               = "device_token"
let kdevice_type                = "device_type"
let klanguage                   = "language"
let kname                       = "name"
let kprofile_pic                = "profile_pic"
let kpassword                   = "password"
let klatitude                   = "latitude"
let klongitude                  = "longitude"
let kdebugMode                  = "debug_mode"
let kOTP                        = "otp"
let kgender                     = "gender"
let kcountryCode                = "country_code"


//MARK:======= LOGOUT PARAMETER KEY =====
let ksession                      = "session_token"



//MARK:======= RESET PARAMETER KEY =====
let kpassengerId                  = "passenger_id"


//MARK:======= FARE CALCULATER PARAMETER KEY =====
let kpick_latitude                = "pick_latitude"
let kpick_longitude               = "pick_longitude"
let kdrop_latitude                = "drop_latitude"
let kdrop_longitude               = "drop_longitude"
let kvehicle_type_city_id         = "vehicle_type_city_id"

//MARK:======= SEND REQUEST PARAMETER KEY =====

let kappointment_date            = "appointment_date"
let kpick_address                = "pick_address"
let kvehicle_type_id             = "vehicle_type_id"
let kappointment_timezone        = "appointment_timezone"
let kpromocode_id                = "promocode_id"
let kbooking_type                = "booking_type"
let kdrop_address                = "drop_address"

//MARK:======= GET APPOINTMENT PARAMETER KEY =====
let kapp_appointment_id                = "app_appointment_id"


//MARK:======= CANCEL REQUEST PARAMETER KEY =====


let krequest_date                   = "request_date"
let kuser_timezone                  = "user_timezone"
let kcancel_status                  = "cancel_status"



//MARK:======= PUBNUB MESSAGE PARAMETER KEY =====


let klt                                     = "lt"
let klg                                     = "lg"
let kst                                     = "st"



//MARK:======= HISTORY REQUEST PARAMETER KEY =====


let kend_dt                                 = "end_dt"
let kstart_dt                               = "start_dt"


//MARK:======= FEEDBACK REQUEST PARAMETER KEY =====

let krating                                 = "rating"
let kreview                                 = "review"


//MARK:======= PAGES REQUEST PARAMETER KEY =====

let kidentifier                             = "identifier"


//MARK:======= CHANGE PASSWORD REQUEST PARAMETER KEY =====

let knewpassword                            = "newpassword"
let koldpassword                            = "oldpassword"

//MARK:======= VALIDATE PROMOCODE REQUEST PARAMETER KEY =====

let kpromocode_text                            = "promocode_text"




//MARK:======= USER DEFAULT KEY =====

let DEVICE_TOKEN                = "deviceToken"
let SESSION_TOKEN               = "sessionToken"
let USER_PROFILE                = "user_profile"
let CAR_TYPES                   = "car_types"
let EMAIL                       = "email"

