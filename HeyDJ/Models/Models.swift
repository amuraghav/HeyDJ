//
//  Models.swift
//  HeyDJ
//
//  Created by Pankajr on 22/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import Foundation


struct ResponseModel : Codable{
    
    let modulenamespace: String?
    let response_key:String?
    let response_msg:String?
    let response_status:Int?
    let response_data : ResponseData?
    
}
struct ResponseData : Codable{
    
    let sms_otp :String?
    let session_token : String?
    let profile : Profile?
    
}


struct Profile : Codable {
    let user_id:String?
    let name:String?
    let third_party_id:String?
    let qr_code_image:String?
    let profile_pic:String?
    let email:String?
    let mobile:String?
    let status:String?
    let type:String?
    let added_date:String?
    let country_code:String?
    let stripe_id:String?
    let normal_login_status:String?
    
    
    
    
}


//struct OtpModel : Codable{
//
//    let sms_otp : Int?
//
//
//}


