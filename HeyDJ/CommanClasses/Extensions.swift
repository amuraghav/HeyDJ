//
//  Extensions.swift
//  StandridgeApp
//
//  Created by admin on 20/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
class func hexStringToUIColor (hex:String) -> UIColor {
    
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
    

}

extension UIView{
    
    @discardableResult //remove unused warning
     func  viewCornerRaddius(with raddi:Float!)->UIView {
      self.layer.cornerRadius = CGFloat(raddi)
        self.clipsToBounds = true
      return self
    }
     @discardableResult //remove unused warning
    func  viewBorderColorWithRaddi(thickness:Float!,raddi:CGFloat,color:UIColor)->UIView {
        self.layer.borderWidth = CGFloat(thickness)
        self.layer.cornerRadius = CGFloat(raddi)
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
        return self
    }
    
    var isViewInteraction:Bool{
        return  self.isUserInteractionEnabled
    }

}

//:============
//MARK:-
//:=============
extension UIImageView{
    
//    
//    open func setImageWithUrl(urlString:String){
//        self.setShowActivityIndicator(true)
//        self.setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
//              return  self.sd_setImage(with: URL(string: urlString))
//        
//    }
//    
//    open  func setImagePlaceholderWithUrl(urlString:String,placeholderImage:String){
//        self.setShowActivityIndicator(true)
//        self.setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
//        return  self.sd_setImage(with: URL(string: urlString), placeholderImage:UIImage(named: placeholderImage))
    
  //  }
}

//:=============
//MARK:-
//:=============
extension UIButton{
    
    open func setImageWithUrl(urlString:String){
        
//        self.imageView?.setShowActivityIndicator(true)
//        self.imageView?.setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
        return  self.sd_setImage(with: URL(string: urlString), for: UIControlState.normal)
    }
    
    open  func setImagePlaceholderWithUrl(urlString:String,placeholderImage:String){
//        self.imageView?.setShowActivityIndicator(true)
//        self.imageView?.setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
        return  self.sd_setImage(with: URL(string: urlString), for: UIControlState.normal, placeholderImage: UIImage(named: placeholderImage))
        
        
    }
}

extension UIView {
    
    func lock() {
        if let _ = viewWithTag(10) {
            //View is already locked
        }
        else {
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
            lockView.tag = 10
            lockView.alpha = 0.0
            let activity = UIActivityIndicatorView(activityIndicatorStyle: .white)
            activity.hidesWhenStopped = true
            activity.center = lockView.center
            lockView.addSubview(activity)
            activity.startAnimating()
            addSubview(lockView)
            
            UIView.animate(withDuration: 0.2) {
                lockView.alpha = 1.0
            }
        }
    }
    
    func unlock() {
        if let lockView = viewWithTag(10) {
            UIView.animate(withDuration: 0.2, animations: {
                lockView.alpha = 0.0
            }) { finished in
                lockView.removeFromSuperview()
            }
        }
    }
    
    func fadeOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = 0.0
        }
    }
    
    func fadeIn(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = 1.0
        }
    }
    
    class func viewFromNibName(name: String) -> UIView? {
        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return views?.first as? UIView
    }
}


extension NSMutableAttributedString {
//    func fontStyleLatoMedium(_ text:String,fontSize:CGFloat) -> NSMutableAttributedString {
//        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont(name: "Lato-Medium", size: fontSize)!,NSForegroundColorAttributeName:UIColor.darkGray]
//        let mediumString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
//        self.append(mediumString)
//        return self
//    }
//    
    func fontStyleLatoRegular(_ text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.append(normal)
        return self
    }
}
extension UIDatePicker{
    
    //MARK:-Convert To Date in Specific format
    var convertDateFormatter:String {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let converteddate = dateFormatter.string(from: self.date)
        return converteddate
    }
    
    
}


extension UINavigationController{
    
    
    func customNavigation(controller:UIViewController) {
        
        
        
        controller.navigationController?.navigationBar.isHidden = false
        controller.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        controller.navigationController?.navigationBar.shadowImage = UIImage()
        controller.navigationController?.navigationBar.isTranslucent = true
        //return controller.navigationController!

    }
    
    
    
    
    
}


//TODO: Uncomment code for set image from url  without AFNetworking
/*extension UIImageView {
    public func imageFromUrlHTTPS(urlString: String) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let datatask =  session.dataTask(with: request) { (data, response, error) -> Void in
            if let imageData = data as Data? {
                self.image = UIImage(data: imageData)
            }
            
            
        }
        datatask.resume()
    }
}
 */




