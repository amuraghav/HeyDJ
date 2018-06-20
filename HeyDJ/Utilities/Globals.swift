//
//  Globals.swift
//  GlobalIts
//
//  Created by Saurabh Sharma on 05/01/17.
//  Copyright © 2017 AppPie. All rights reserved.
//

import Foundation
import UIKit


typealias JSONDictionary = [String : Any]
typealias JSONDictionaryArray = [[String : Any]]


class Globals {
 class func shadowView(view:UIView) -> UIView {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 1
        
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = true ? UIScreen.main.scale : 1
    
    return view
    }
    
    
   class func callImagePicker(controller : UIViewController,imagePicker : UIImagePickerController){
        
        
        imagePicker.allowsEditing = true
        let optionMenu = UIAlertController(title : nil , message: "Choose preferred source type", preferredStyle: UIAlertControllerStyle.actionSheet)
        let camera = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { action in
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            controller.present(imagePicker, animated: true, completion: nil)
        })
        optionMenu.addAction(camera)
        optionMenu.addAction(UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default, handler: { action in
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            controller.present(imagePicker, animated: true, completion: nil)
            
        }))
        optionMenu.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
            action in
            optionMenu.dismiss(animated: true, completion: nil)}))
        controller.present(optionMenu, animated: true, completion: nil)
        
    }
    
    
    class func showAlert(message : String , controller : UIViewController) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Block Creation For Return Bool Value in Logout Process
    internal typealias CompletionBlock = (_ bool:Bool)->Void
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
//        myMutableString.addAttribute(NSForegroundColorAttributeName, value:UIColor.black, range: NSRange(location:0,length:myString.count))
//        alertController.setValue(myMutableString, forKey: "attributedTitle")
//        
//        // Change Message With Color and Font
//        var messageMutableString = NSMutableAttributedString()
//        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSFontAttributeName:UIFont(name: "OpenSans-Semibold", size: 12.0)!])
//        messageMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.black, range: NSRange(location:0,length:message.count))
//        alertController.setValue(messageMutableString, forKey: "attributedMessage")
//        
//        // Action.
//        let okAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) {
//            UIAlertAction in
//            callback(true)
//        }
//        okAction.setValue(UIColor.black, forKey: "titleTextColor")
//        let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) {
//            UIAlertAction in
//            callback(false)
//        }
//        cancelAction.setValue(UIColor.black, forKey: "titleTextColor")
//        // Add the actions
//        alertController.addAction(okAction)
//        alertController.addAction(cancelAction)
//        viewController.present(alertController, animated: true, completion: nil)
//        
//    }
    
    
}

extension Date{
    
    
    func dateStringFromDate(format : String) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = format
        let converteddate = dateFormatter.string(from: self)
        return converteddate
    }
    
}

extension String{
    
    func dateStringFromAnotherDateString(currentFormat : String , requiredFormat : String) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = currentFormat
        let currentdate = dateFormatter.date(from: self)
        dateFormatter.dateFormat = requiredFormat
        let convertedDate = dateFormatter.string(from: currentdate!)
        return convertedDate
    }
    
    
}
class PasswordTextField: UITextField,UITextFieldDelegate {
    let button = UIButton()
    
    
//    override func draw(_ rect: CGRect) {
//        button.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
//        self.delegate = self
//        button.setTitle("Show", for: UIControlState.normal)
//        button.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
//        button.titleLabel?.font = UIFont(name: "", size: 10.0)
//        self.isSecureTextEntry = true
//        button.isSelected = false
//        self.rightViewMode = .always
//        button.addTarget(self, action: #selector(showHide), for: UIControlEvents.touchUpInside)
//        self.rightView = button
//        button.isHidden = true
//        
//        print("draw")
//    }
    
    
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textString = textField.text! as NSString

            textField.text = textString.replacingCharacters(in: range, with: string)
        
        
        if(string == "" && range.location == 0){
           button.setTitle("Show", for: UIControlState.normal)
            button.isHidden = true
            self.isSecureTextEntry = true
            button.isSelected = false
            
        }
        
        else{

            button.isHidden = false
            
        }
        


        return false
    }

    
    func showHide() {
        if(button.isSelected){
            
            button.setTitle("Show", for: UIControlState.normal)
            self.isSecureTextEntry = true
            button.isSelected = false
            
        }
        else{
            button.setTitle("Hide", for: UIControlState.normal)
            self.isSecureTextEntry = false
            button.isSelected = true
            
        }
        
        
    }
    
    
    
}



//MARK:- print_debug
//:-----
func print_debug<T>(_ object: T){
    print(object)
    
}




