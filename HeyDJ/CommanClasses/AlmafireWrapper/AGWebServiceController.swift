//
//  AGWebServiceController.swift
//  TravelClaimSwift
//
//  Created by Akash Gaur on 05/09/17.
//  Copyright © 2017 Appy pie. All rights reserved.
//


import UIKit
import Alamofire
//import SwiftyJSON


//:=========================================================================
//MARK:- ######## GLOBLE DECLARATION ###########
//:=========================================================================


let FILE_NAME = "profile_pic.png"
let EXT_TYPE = "image/png"
let APPLICATION_TYPE = "Accept"
let APPLICATION = "application/json"
let CONTENT = "Content-Type"
let CONTENT_TYPE = "application/json; charset=UTF-8"
let ATHORIZATION  = "Authorization"
let ATHORIZATION_KEY  = "Basic SEFMQVBJOkhBTEFQSQ=="
//let ATHORIZATION_KEY  = "Basic WUhBTElGQVhBUEk6WUhBTElGQVhBUEk="        //  for VehicalReqiurement APi

let CONFIGURATIONID_KEY  = "CONFIGURATIONID"
let CONFIGURATIONID  = "9994"



//:=========================================================================
//MARK:- ########### API HEADER #################
//:=========================================================================

let header = [
    APPLICATION_TYPE : APPLICATION,
    CONTENT : CONTENT_TYPE,
    ATHORIZATION : ATHORIZATION_KEY
//    CONFIGURATIONID_KEY : CONFIGURATIONID
]




class AGWebServiceController: NSObject {
    
    
//:=========================================================================
//MARK:- ######### CALL API USING BODY ##################
//:=========================================================================
    
    
//    //MARK:- GET REQUEST
//    class func GetRequest(url:String,methodName:String ,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
//        
//        let  urlString = "\(url)\(methodName)"
//        
//        print("**************** Service URL :--\(url)\(methodName)")
//        
//        
//        Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default, headers: header).responseJSON { (response) -> Void in
//            
//            switch(response.result) {
//            case .success(_):
//                
//                let json: AnyObject? = try! JSONSerialization.jsonObject(with: (response.data!), options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject?
//                
//
//                
//                if let jsonDict = json as? JSONDictionary {
//                    
//                    print_debug("\n\nRECEIVED DATA \n\n\n\(jsonDict)")
//                    
//                    success(JSON(jsonDict))
//                    
//                } else {
//                
//                    Utils.showProgressWithError(status:  "Error in JSON Parsing")
//                    Utils.dismissProgress()
//                    print_debug("Error in JSON Parsing")
//                }
//                break
//                
//            case .failure(_):
//                
//                  failure(response.result.error!)
//                print("Failure : \(String(describing: response.result.error))")
//                break
//                
//            }
//        }
//    }
    
    
    
//    //MARK:- GET REQUEST DISTANCE GOOGLE API
//    class func GetRequestDistance(url:String,success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
//        
//        let  urlString = url
//        
//        print("**************** Service URL :--\(url)")
//        
//        
//        Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default, headers: header).responseJSON { (response) -> Void in
//            
//            switch(response.result) {
//            case .success(_):
//                
//                let json: AnyObject? = try! JSONSerialization.jsonObject(with: (response.data!), options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject?
//                
//                
//                
//                if let jsonDict = json as? JSONDictionary {
//                    
//                    print_debug("\n\nRECEIVED DATA \n\n\n\(jsonDict)")
//                    
//                    success(JSON(jsonDict))
//                    
//                } else {
//                    
//                    Utils.showProgressWithError(status:  "Error in JSON Parsing")
//                    Utils.dismissProgress()
//                    print_debug("Error in JSON Parsing")
//                }
//                break
//                
//            case .failure(_):
//                
//                failure(response.result.error!)
//                print("Failure : \(String(describing: response.result.error))")
//                break
//                
//            }
//        }
//    }
    
    
    
    //MARK:- POST REQUEST
    
    class func POSTRequest(url:String,methodName:String,param :JSONDictionary, success:@escaping (Data) -> Void, failure:@escaping (Error) -> Void){
        
        let  urlString = "\(url)\(methodName)"
        print("**************** Service URL :--\(url)\(methodName)")
        
        print("\n \n ******With Parameters**********:--\(param) \n\n")
        
        
        
        Alamofire.request(urlString,method: .post, parameters: param, encoding: JSONEncoding.default, headers:header).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
                success(response.data!)
                
                
//                do{
//                    let obj =  try JSONDecoder().decode(ResponseModel.self, from: response.data!)
//
//                    success(obj)
//
//                }
//
//                    catch let error as NSError {
//
//                        Utils.showProgressWithError(status:  "Error in JSON Parsing")
//
//                        print_debug(error)
//                        return
//                    }
                
                
//                let json: AnyObject? = try! JSONSerialization.jsonObject(with: (response.data!), options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject?
                
                
                
                
//                if let jsonDict = json as? JSONDictionary {
//                    
//                    print_debug("\n\nRECEIVED DATA \n\n\n\(jsonDict)")
//                    
//                    success(JSON(jsonDict))
//                    
//                } else {
//                    
//                    Utils.showProgressWithError(status:  "Error in JSON Parsing")
//
//                    print_debug("Error in JSON Parsing")
//                }
                break
                
            case .failure(_):
                failure(response.result.error!)

                print("Failure : \(String(describing: response.result.error))")
                break
                
            }
        }
        
        
    }
    
   
    
    
//:=========================================================================
//MARK:- ############ CALL API USING MULTIPART ####################
//:=========================================================================
    
    
    
    //MARK:- POST REQUEST
    
//    class func POSTRequestWithMultiPart(url:String,method:String,param :JSONDictionary,imageKey:String!,image : UIImage?,addImageflag : Bool, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//        let  urlString = "\(url)\(method)"
//
//
//        print("**************** Service URL :--\(url)\(method)")
//
//        print("\n \n ******With Parameters**********:--\(param) \n\n")
//
//
//        Alamofire.upload(multipartFormData: { (multipartFormData:MultipartFormData?) in
//
//            for (key, value) in param {
//                multipartFormData?.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//            }
//
//
//            if addImageflag{
//                guard let data = multipartFormData else {
//                    return
//                }
//                guard let userimage = image else {
//                    return
//                }
//                let imagedata:Data = UIImageJPEGRepresentation(userimage, 1)!
//
//                data.append(imagedata, withName: imageKey,fileName: FILE_NAME, mimeType: EXT_TYPE)
//
//            }
//
//        },
//                         to:urlString,method : .post ,headers : header )
//        { (result) in
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { response in
//                    print(response.result.error as Any)
//
//                    let json: AnyObject? = try! JSONSerialization.jsonObject(with: (response.data!), options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject?
//
//                    if let jsonDict = json as? JSONDictionary {
//
//                        print_debug("\n\nRECEIVED DATA \n\n\n\(jsonDict)")
//
//                        success(JSON(jsonDict))
//
//                    } else {
//
//                        Utils.showProgressWithError(status:  "Error in JSON Parsing")
//                        print_debug("Error in JSON Parsing")
//                    }
//                }
//
//            case .failure(let encodingError):
//                failure(encodingError)
//
//                print(encodingError)
//            }
//        }
//
//    }
    
    //MARK:- POST REQUEST
    
//    class func POSTRequestWithMultiPart(url:String,method:String,param :JSONDictionary,imageKeyArr:[String],imageArr : [UIImage],addImageflag : Bool, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//
//        let  urlString = "\(url)\(method)"
//
//
//        print("**************** Service URL :--\(url)\(method)")
//
//        print("\n \n ******With Parameters**********:--\(param) \n\n")
//
//
//        Alamofire.upload(multipartFormData: { (multipartFormData:MultipartFormData?) in
//
//            for (key, value) in param {
//                multipartFormData?.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//            }
//
//
//            if addImageflag{
//                guard let data = multipartFormData else {
//                    return
//                }
//
//                for (index,image) in imageArr.enumerated(){
//
//                    //                guard let userimage = image else {
//                    //                    return
//                    //                }
//                    let imagedata:Data = UIImageJPEGRepresentation(image, 1)!
//
//                    data.append(imagedata, withName: imageKeyArr[index],fileName: imageKeyArr[index] + ".png", mimeType: EXT_TYPE)
//
//                }
//
//            }
//
//        },
//                         to:urlString,method : .post ,headers : header )
//        { (result) in
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { response in
//                    print(response.result.error as Any)
//
//                    let json: AnyObject? = try! JSONSerialization.jsonObject(with: (response.data!), options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject?
//
//                    if let jsonDict = json as? JSONDictionary {
//
//                        print_debug("\n\nRECEIVED DATA \n\n\n\(jsonDict)")
//
//                        success(JSON(jsonDict))
//
//                    } else {
//
//                        Utils.showProgressWithError(status:  "Error in JSON Parsing")
//                        print_debug("Error in JSON Parsing")
//                    }
//                }
//
//            case .failure(let encodingError):
//                failure(encodingError)
//
//                print(encodingError)
//            }
//        }
//
//    }
//
    
    //MARK:- GET REQUEST
    
//    class func GETRequestWithMultiPart(url:String,method:String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
//        
//        let  urlString = "\(url)\(method)"
//        
//        
//        print("**************** Service URL :--\(url)\(method)")
//        
//        
//        Alamofire.upload(multipartFormData: { (multipartFormData:MultipartFormData?) in}, to:urlString,method : .get ,headers : [:] ){ (result) in
//            
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                })
//                
//                upload.responseJSON { response in
//                    print(response.result.error as Any)
//                    
//                    
//                    let json: AnyObject? = try! JSONSerialization.jsonObject(with: (response.data!), options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject?
//                    
//                    if let jsonDict = json as? JSONDictionary {
//                        
//                        print_debug("\n\nRECEIVED DATA \n\n\n\(jsonDict)")
//                        
//                        success(JSON(jsonDict))
//                        
//                    } else {
//                        
//                        Utils.showProgressWithError(status:  "Error in JSON Parsing")
//
//                        print_debug("Error in JSON Parsing")
//                    }
//                }
//                
//            case .failure(let encodingError):
//                failure(encodingError)
//
//                print(encodingError)
//            }
//        }
//        
//    }
    

//:=========================================================================
//MARK:- ############ CANCEL REQUEST ####################     (IN-PROGRESS)
//:=========================================================================
    
    

    //MARK:- CANCEL ALL REQUEST

    
    class func CancelAllRequest() ->Void {
        Alamofire.SessionManager.default.session.getAllTasks { (tasks) in
            
            tasks.forEach({$0.cancel()})
        }
    }
    
    
    
    //MARK:- CANCEL SPECIFIC REQUEST

    
    class func CancelARequest() ->Void {
        
        
        Alamofire.SessionManager.default.session.getAllTasks { (tasks) in
            tasks.forEach({task in
                if task.currentRequest?.url?.lastPathComponent == "login"
                {
                    task.cancel()
                }
            })
        }
           }

}
