//
//  Utils.swift
//  StandridgeApp
//
//  Created by admin on 20/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import KVNProgress
//import SwiftyJSON

class SSCommonClass{
    
    //MARK:- SINGLETON OBJECT
    static let sharedInstance = SSCommonClass()
    
    
    //MARK:- PROPERTIES
    static let activitIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var indicatorView:UIView!
    internal typealias CallbackHandler = (_ action:Bool?)->Void
    
    
//    class func ToastShowMessage(msg : String,viewController:UIViewController?) {
//        
//             SSCommonClass.sharedInstance.alertMsg(message: msg, viewController: viewController)
//        
//    }
//    
//    class func ToastWithBlock(msg : String,viewController:UIViewController?,completionHandler:@escaping CallbackHandler) {
//        
//                SSCommonClass.sharedInstance.alertWithBlock(message: msg, viewController: viewController) { (action) in
//            
//            completionHandler(action)
//        }
//        
//    }

    
    //MARK:- KVNProgress Function
    //:------
    
    class func showProgressWithStatus(status:String?){
        KVNProgress.show(withStatus: status)
        
    }
    
    class func showProgressWithSuccess(status:String?){
        
        KVNProgress.showSuccess()
        
    }
    
    class func showProgressOnView(view: UIView,indicatorColor:UIColor?){
        
        
        
        KVNProgress.show(withStatus: "", on: view)
        
        
    }
    
    class func showProgressWithError(status:String?){
        
        KVNProgress.showError(withStatus: status)
    }
    
    class func dismissProgress(){
        
        
        KVNProgress.dismiss()

        /*LoadingIndicatorView.hide()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        // SSCommonClass.sharedInstance.activitIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    */
    }
    
    class func showProgress(controller: UIViewController,indicatorColor:UIColor?){
        
        
//       KVNProgress.show()
        KVNProgress.show(withStatus: "", on: controller.view)

       // LoadingIndicatorView.show(controller.view)
        //UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    
    class func showProgress(loadingText:String,indicatorColor:UIColor?){
        
       // LoadingIndicatorView.show(loadingText)
       // UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    class func showProgress(loadingText:String){
        KVNProgress.show()

        
      //  LoadingIndicatorView.show(loadingText)
       // UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    //MARK: Block Creation For Return Bool Value in Logout Process
    internal typealias CompletionBlock = (_ bool:Bool)->Void
    //MARK:- alertMessage
    //:--
//    class func alertPermissionMessage(message:String,viewController:UIViewController,callback:@escaping CompletionBlock){
//        
//        let title = ""
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
//        // Background color.
//        let backView = alertController.view.subviews.last?.subviews.last
//        backView?.layer.cornerRadius = 10.0
//        backView?.backgroundColor = UIColor.white
//        
//        // Change Title With Color and Font:
//        
//        let myString  = title
//        var myMutableString = NSMutableAttributedString()
//        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName:UIFont(name: "OpenSans-Semibold", size: 18.0)!])
//        myMutableString.addAttribute(NSForegroundColorAttributeName, value: navigationBarColor, range: NSRange(location:0,length:myString.characters.count))
//        alertController.setValue(myMutableString, forKey: "attributedTitle")
//        
//        // Change Message With Color and Font
//        var messageMutableString = NSMutableAttributedString()
//        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSFontAttributeName:UIFont(name: "OpenSans-Semibold", size: 12.0)!])
//        messageMutableString.addAttribute(NSForegroundColorAttributeName, value: appColor, range: NSRange(location:0,length:message.characters.count))
//        alertController.setValue(messageMutableString, forKey: "attributedMessage")
//        
//        // Action.
//        let okAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) {
//            UIAlertAction in
//            callback(true)
//        }
//        okAction.setValue(appColor, forKey: "titleTextColor")
//        let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) {
//            UIAlertAction in
//            callback(false)
//        }
//        cancelAction.setValue(appColor, forKey: "titleTextColor")
//        // Add the actions
//        alertController.addAction(okAction)
//        alertController.addAction(cancelAction)
//        viewController.present(alertController, animated: true, completion: nil)
//    }
    
    
    //MARK:- saveUserDefault
    //:---
    class func saveUserDefault (object : String , key : String) {
        
        let userDefault :UserDefaults = UserDefaults.standard
        userDefault.setValue(object, forKey: key)
        userDefault.synchronize()
        
        
    }
    
    //MARK:- saveUserDefault
    //:---
//    class func saveUserDefaultDict (object : [String:JSON] , key : String) {
//
//        let userDefault :UserDefaults = UserDefaults.standard
//        let nsdata:Data = NSKeyedArchiver.archivedData(withRootObject: object)
//        userDefault.setValue(nsdata, forKey: key)
//        userDefault.synchronize()
//    }
    
    //MARK:- getUserDefaultForKeyDict
//    class func getUserDefaultForKeyDict( key : String) -> JSON? {
//        
//        let userDefault :UserDefaults = UserDefaults.standard
//        if let  obj : JSON = userDefault.object(forKey: key) as! JSON?{
//            return obj
//        }else {
//            return nil
//        }
//    }
    
    //MARK:- getUserDefaultForKey
    class func getUserDefaultForKey ( key : String) -> AnyObject? {
        
        let userDefault :UserDefaults = UserDefaults.standard
        if let  obj : AnyObject = userDefault.object(forKey: key) as AnyObject?{
            
            return obj
            
        }else {
            return nil
        }
    }
    class func setImageWithUrl(url:String){
        
    }
    //MARK:- alertMessage
    //:--
//    class func alertMessage(message:String?,viewController:UIViewController?){
//        
//        
//        SSCommonClass.sharedInstance.alertMsg(message: message!, viewController: viewController)
//        
//    }
    
//    func alertMsg(message:String,viewController:UIViewController?){
//
//        let title = ""
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
//
//
//        let backView = alertController.view.subviews.last?.subviews.last
//        backView?.layer.cornerRadius = 10.0
//        backView?.backgroundColor = UIColor.white
//
//        // Change Title With Color and Font:
//
//        let myString  = title
//        var myMutableString = NSMutableAttributedString()
//        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName:UIFont(name: "OpenSans-Semibold", size: 18.0)!])
//        myMutableString.addAttribute(NSForegroundColorAttributeName, value: navigationBarColor, range: NSRange(location:0,length:myString.characters.count))
//        alertController.setValue(myMutableString, forKey: "attributedTitle")
//
//        // Change Message With Color and Font
//        var messageMutableString = NSMutableAttributedString()
//        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSFontAttributeName:UIFont(name: "OpenSans-Semibold", size: 12.0)!])
//        messageMutableString.addAttribute(NSForegroundColorAttributeName, value: appColor, range: NSRange(location:0,length:message.characters.count))
//        alertController.setValue(messageMutableString, forKey: "attributedMessage")
//
//        // Action.
//        let okAction = UIAlertAction(title: kOK, style: UIAlertActionStyle.default) {
//            UIAlertAction in
//        }
//        okAction.setValue(appColor, forKey: "titleTextColor")
//        alertController.addAction(okAction)
//        viewController!.present(alertController, animated: true, completion: nil)
//    }
//
//    func alertWithBlock(message:String,viewController:UIViewController?,completionHandler:@escaping CallbackHandler){
//
//        let title = ""
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
//
//
//        let backView = alertController.view.subviews.last?.subviews.last
//        backView?.layer.cornerRadius = 10.0
//        backView?.backgroundColor = UIColor.white
//
//        // Change Title With Color and Font:
//
//        let myString  = title
//        var myMutableString = NSMutableAttributedString()
//        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName:UIFont(name: "OpenSans-Semibold", size: 18.0)!])
//        myMutableString.addAttribute(NSForegroundColorAttributeName, value: navigationBarColor, range: NSRange(location:0,length:myString.characters.count))
//        alertController.setValue(myMutableString, forKey: "attributedTitle")
//
//        // Change Message With Color and Font
//        var messageMutableString = NSMutableAttributedString()
//        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSFontAttributeName:UIFont(name: "OpenSans-Semibold", size: 12.0)!])
//        messageMutableString.addAttribute(NSForegroundColorAttributeName, value: appColor, range: NSRange(location:0,length:message.characters.count))
//        alertController.setValue(messageMutableString, forKey: "attributedMessage")
//
//        // Action.
//        let okAction = UIAlertAction(title: kOK, style: UIAlertActionStyle.default) {
//            UIAlertAction in
//            completionHandler(true)
//        }
//        okAction.setValue(appColor, forKey: "titleTextColor")
//        alertController.addAction(okAction)
//        viewController!.present(alertController, animated: true, completion: nil)
//    }
//
    
    
    class func stringFromDate(date : Date) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MM-dd-yyyy"
        
        let resultString = inputFormatter.string(from: date)
        
        return resultString
        
        
    }
    
    class func stringFromDateReturn(date : Date) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MM/dd/yyyy"
        
        let resultString = inputFormatter.string(from: date)
        
        return resultString
        
        
    }
    
    //TODO :: RAM
    class func stringdateReturn(date : Date) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        
        let resultString = inputFormatter.string(from: date)
        
        return resultString
        
        
    }
    
    
    class func timeStringFromDate(date : Date) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "hh:mm a"
        
        let resultString = inputFormatter.string(from: date)
        
        return resultString
        
        
    }
    
    
    class func dateFromString(dateStr : String) -> Date {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MM-dd-yyyy"
        
        let resultDate = inputFormatter.date(from: dateStr)
        
        return resultDate!
        
        
    }
    
    class func stringFromAddOnDateString(date : String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"
        
        
        let resultDate = inputFormatter.date(from: date)
       
        inputFormatter.timeZone = TimeZone.current
        inputFormatter.dateFormat = "dd/MM/yyyy"
        
        let resultString = inputFormatter.string(from: resultDate!)
        
        return resultString
        
        
    }
    
    class func isCurrentDate(date : String) -> Bool {
        let inputFormatter = DateFormatter()
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
       
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"
        
        let resultDate = inputFormatter.date(from: date)
         inputFormatter.timeZone = TimeZone.current
        inputFormatter.dateFormat = "MM-dd-yyyy"
        let resultString = inputFormatter.string(from: resultDate!)
        let currentDate = inputFormatter.string(from: Date())
        return (resultString == currentDate ) ? true :false
        
   
        
        
    }
    
    class func convertDateToTime(date :String) -> String{
        
        let inputFormatter = DateFormatter()
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"
        let resultDate = inputFormatter.date(from: date)
         inputFormatter.timeZone = TimeZone.current
        inputFormatter.dateFormat = "hh:mm a"
        let resultString1 = inputFormatter.string(from: resultDate!)
        
        return resultString1
        
    }
    
    
    
    
    class func stringTimeGivenString(time :String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh:mm:ss a"
        let date: Date? = dateFormatter.date(from: time)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "hh:mm a"
        let resultString1 = dateFormatter.string(from: date!)
        
        return resultString1
        
    }
    
    class func dateFromTimeString(time :String) -> Date{
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM-dd-yyyy hh:mm a"
        let date: Date? = dateFormatter.date(from: time)
       
        
        return date!
        
    }
    
    class func dateFromDateString(time :String , formate : String) -> Date{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        let date: Date? = dateFormatter.date(from: time)
        
        
        return date!
        
    }
    
    
    class func getLabelByTag(tag : Int, curentView : UIView) -> UILabel{
        
        let label   = curentView.viewWithTag(tag) as! UILabel
        
        return label
        
        
    }
    
  class func showActivityIndicator(controller : UIViewController) {

        controller.view.addSubview(SSCommonClass.activitIndicator)
        SSCommonClass.activitIndicator.frame = controller.view.bounds
        SSCommonClass.activitIndicator.color = UIColor.red
        SSCommonClass.activitIndicator.startAnimating()
    }
    
    
 class   func hideActivityIndicator() {
    
        SSCommonClass.activitIndicator.stopAnimating()
        SSCommonClass.activitIndicator.hidesWhenStopped = true
    }
    
    
    
    
//   class func changeToMutableString(len :Int,str : String) -> NSMutableAttributedString {
//        var mutableString = NSMutableAttributedString()
//        let attrs1     = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 15.0)]
//        mutableString   =        NSMutableAttributedString(string: str, attributes:attrs1  )
//        mutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.black, range: NSRange(location:0,length:len))
//        
//        return mutableString
//        
//    }
//    
//    
//    class func changeToMutableStringTracking(len :Int,str : String) -> NSMutableAttributedString {
//        var mutableString = NSMutableAttributedString()
//         let attrs1     = [NSFontAttributeName : UIFont(name: "OpenSans-Bold", size: 17.0)!]
//        mutableString   =         NSMutableAttributedString(string: str, attributes:attrs1  )
//        let attrs2     = [NSFontAttributeName : UIFont.systemFont(ofSize: 17.0)]
//        mutableString.addAttributes(attrs2, range: NSRange(location:0,length:len))
//        
//        return mutableString
//        
//    }

    
    
}










