//
//  Utils.swift
//  StandridgeApp
//
//  Created by admin on 20/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
import UIKit
//import GTToast
import SDWebImage
import KVNProgress




class Utils{
    
    //MARK:- SINGLETON OBJECT
    static let sharedInstance = Utils()
    
    
    //MARK:- PROPERTIES
    var indicator:UIActivityIndicatorView!
    var indicatorView:UIView!
    
    
    //MARK:- alertMessage
    //:--
    class func MessageAlert(message:String){
        
        //SCLAlertView().showInfo(message, subTitle: "")
        
    }
    
    class  func ErrorAlert(msg:String,subTitle:String){
        
       // SCLAlertView().showError(msg,subTitle: subTitle) // Error
        
    }
    
    class  func NoticeAlert(message:String){
        //SCLAlertView().showNotice(message, subTitle: "This is a more descriptive notice text.") // Notice
    }
    
    class  func WarningAlert(message:String){
        //SCLAlertView().showWarning(message, subTitle: "") // Warning
    }
    
    class  func InfoAlert(message:String){
//        SCLAlertView().showInfo("Hello Info", subTitle: "This is a more descriptive info text.") // Info
    }
    
  /*
    class func ToastShowMessage(msg : String) {
        
        let config = GTToastConfig(
            contentInsets: UIEdgeInsets(top:10, left: 20, bottom: 10, right: 10),
            cornerRadius: 8.0,
            font: UIFont.systemFont(ofSize: 11),
            textColor: UIColor.yellow,
            textAlignment: NSTextAlignment.right,
            backgroundColor: UIColor.black.withAlphaComponent(0.8),
            animation:GTScaleAnimation() ,
            displayInterval: 2,
            bottomMargin: 15.0,
            imageAlignment: GTToastAlignment.top,
            maxImageSize: CGSize(width: SCREEN_WIDTH - 40, height: 150)
        )
        
       
        //GTToast.create(msg)
        GTToast.create(msg, config: config, image: nil).show()
    }
   
    */
    
    //MARK:- KVNProgress Function
    //:------
    
    //For Show Progress
    class func showProgress(){
        KVNProgress.show()
        
    }
    class func showProgressWithStatus(status:String?){
        KVNProgress.show(withStatus: status)
       
        
    }
    
    class func showProgressWithSuccess(status:String?){
        
        KVNProgress.showSuccess()
        
    }
    
    class func showProgressWithError(status:String?){
        
        KVNProgress.showError(withStatus: status)
    }

//    class func dismissProgress(){
//        NSProgress.dismiss()
//    }

    func hideActivityIndicator() {
        self.indicator.stopAnimating()
        self.indicatorView.removeFromSuperview()
    }
    
    
    //MARK:- saveUserDefault
    //:---
    class func saveUserDefault (object : String , key : String) {
        
        let userDefault :UserDefaults = UserDefaults.standard
        userDefault.setValue(object, forKey: key)
        userDefault.synchronize()
        
    }
    
    
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
  /*  class func alertMessage(message:String,viewController:UIViewController){
        
        let alert = UIAlertController(title: "Travel claim", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        

        let attributedText = NSMutableAttributedString(string: message)
        
        let range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(NSKernAttributeName, value: 1.5, range: range)
        attributedText.addAttribute(NSFontAttributeName, value: UIFont(name: FONT_NUNITOSANS_REGULAR, size: CGFloat(FONT_SIZE_16))!, range: range)
        
        
        alert.addAction(UIAlertAction(title: kOK, style: UIAlertActionStyle.default, handler: {
            (action: UIAlertAction!) in
            
        }))
        
        alert.view.tintColor =  UIColor.hexStringToUIColor(hex: BUTTON_COLOR)

        viewController.present(alert, animated: true, completion: nil)
    }
    */
    }

//:============
//MARK:-
//:=============
extension UIImageView{
        
    open func setImageWithUrl(urlString:String){
        
        
        return  self.sd_setImage(with: URL(string: urlString))
        
        }
        
       open  func setImagePlaceholderWithUrl(urlString:String,placeholderImage:String){
            
            return  self.sd_setImage(with: URL(string: urlString), placeholderImage:UIImage(named: placeholderImage))
        
    }
}

//:=============
//MARK:-
//:=============

/*
extension UIButton{
    
    open func setImageWithUrl(urlString:String){
        
        
        return  self.sd_setImage(with: URL(string: urlString), for: UIControlState.normal)
        
    }
    
    open  func setImagePlaceholderWithUrl(urlString:String,placeholderImage:String){
        
        return  self.sd_setImage(with: URL(string: urlString), for: UIControlState.normal, placeholderImage: UIImage(named: placeholderImage))
        
        
    }
}
*/






