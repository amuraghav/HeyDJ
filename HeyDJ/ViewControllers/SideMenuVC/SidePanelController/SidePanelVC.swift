//
//  SidePanelVC.swift
//
//  Created by admin on 28/12/16.
//  Copyright © 2016 AppPie. All rights reserved.
//


import UIKit
import SlideMenuControllerSwift
import LocalAuthentication

class SidePanelVC: UIViewController {
    
    //MARK:Menu Data Model Representation
    //MARK:
    enum SideMenuItemsType : Int {
        
        case Tip = 0
        case SavedCard = 1
        case ConnectStrip = 2
        case Help = 3
        case Logout = 4
        
        
        var stringRepresentation : String {
            switch self {
            case .Tip : return "Tip"
            case .SavedCard : return "Saved Cards"
            case .ConnectStrip : return "Connect with Stripe"
            case .Help : return "Help"
            case .Logout : return "Logout"
                
            }
        }
        static var count : Int {
            var max = 0
            while let _ = SideMenuItemsType(rawValue: max) {
                max = max + 1
            }
            return max
        }
    }
   
    
    @IBOutlet weak var sidePanelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sidePanelTableView.delegate = self
        self.sidePanelTableView.dataSource = self
        sidePanelTableView.tableFooterView = UIView()
//        self.sidePanelTableView.separatorStyle = .none
//        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
//        sidePanelTableView.backgroundView = activityIndicatorView
//        activityIndicatorView.startAnimating()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.updateMessageCounter), name: NSNotification.Name(rawValue: kNotificationChatMessage), object: nil)
        
        
    }
    
    func updateMessageCounter(){
         self.sidePanelTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.sidePanelTableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension SidePanelVC : UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tipVC = mainStoryboardObj.instantiateViewController(withIdentifier: "TipVC") as! TipVC
        self.slideMenuController()?.toggleLeft()
//                    SharedAppDelegate.parentNavigationController?.viewControllers[0] = tipVC
       
                    SharedAppDelegate.parentNavigationController?.pushViewController(tipVC, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuItemsType.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageArr = [#imageLiteral(resourceName: "Tip"),#imageLiteral(resourceName: "saveCard"),#imageLiteral(resourceName: "stripeconnect"),#imageLiteral(resourceName: "help"),#imageLiteral(resourceName: "logout")]
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuProfileCell") as! SideMenuProfileCell
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuOptionsCell") as! SideMenuOptionsCell
        switch indexPath.row {
        case 0:
            if let name = SSCommonClass.getUserDefaultForKey(key: UserDefaultsKey.name.rawValue) as? String{
                profileCell.userNameLabel.text = name
            }
            if let imageUrl = SSCommonClass.getUserDefaultForKey(key: UserDefaultsKey.fullProfilePic.rawValue) as? String{
                
                if(imageUrl.characters.count > 0){
                profileCell.profilePicButton.setImageWithUrl(urlString: imageUrl)
                }
            }
            
            
            
//            profileCell.profilePicButton.addTarget(self, action:  #selector(SidePanelVC.editProfileSelector), for: UIControlEvents.touchUpInside)
//            profileCell.msgNotificationButton.addTarget(self, action: #selector(SidePanelVC.msgNotificationSelector), for: UIControlEvents.touchUpInside)
//            profileCell.contentView.backgroundColor = AppConstants.appLightColor
//
//            if(SharedAppDelegate.messageCounter > 0){
//               profileCell.notifiCountLabel.isHidden = false
//                profileCell.notifiCountLabel.text = String.init(format: "%d", SharedAppDelegate.messageCounter)
//
//
//            }
//            else{
//
//                profileCell.notifiCountLabel.isHidden = true
//            }

            return profileCell
            
            
        default:
            menuCell.menuImageView.image = imageArr[indexPath.row - 1]
            menuCell.menuItemLabel.text = SideMenuItemsType(rawValue: indexPath.row - 1)?.stringRepresentation
            return menuCell
            
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return  140.0
        }
        return 80.0
    }
    //MARK: Selector Method.
//    func editProfileSelector(sender:UIButton){
//        let lastVC = SharedAppDelegate.parentNavigationController?.viewControllers.last!
//        //let cell = self.sidePanelTableView.tableViewCell(sender: sender)
//        let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
//        if lastVC is ProfileVC {
//            self.slideMenuController()?.toggleLeft()
//        } else {
//            let previousSelectedIndex = selectedSideMenu.rawValue
//            selectedSideMenu = .Profile
//            self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
//            self.slideMenuController()?.toggleLeft()
//            SharedAppDelegate.parentNavigationController?.viewControllers[0] = profileVC
//            SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
//        }
//    }
//    func msgNotificationSelector(button:UIButton){
//
//        let lastVC = SharedAppDelegate.parentNavigationController?.viewControllers.last!
//        //let cell = self.sidePanelTableView.tableViewCell(sender: sender)
//       let messageVC = mainStoryboardObj.instantiateViewController(withIdentifier: "MessagesVC") as! MessagesVC
//        if lastVC is MessagesVC {
//            self.slideMenuController()?.toggleLeft()
//        } else {
//            let previousSelectedIndex = selectedSideMenu.rawValue
//            selectedSideMenu = .Profile
//            self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
//            self.slideMenuController()?.toggleLeft()
//            SharedAppDelegate.parentNavigationController?.viewControllers[0] = messageVC
//            SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
//        }
    
                

        
//        SSCommonClass.alertMessage(message: AppConstants.UnderDevelopment, viewController: self)
    }






    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let lastVC = SharedAppDelegate.parentNavigationController?.viewControllers.last!
//        switch indexPath.row{
//        case 1:
//            let tipVC = mainStoryboardObj.instantiateViewController(withIdentifier: "TipVC") as! TipVC
//
//            SharedAppDelegate.parentNavigationController?.viewControllers[0] = tipVC
//            SharedAppDelegate.parentNavigationController?.popToRootViewController(animated: true)
//
////            if lastVC is TipVC
////            {
////                SlideMenuController.toggleLeft()
////            } else {
////                let previousSelectedIndex = selectedSideMenu.rawValue
////                selectedSideMenu = .Home
////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
////                self.slideMenuController()?.toggleLeft()
////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = homeVC
////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
//
////        case 0:
////            let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
////            if lastVC is ProfileVC {
////                self.slideMenuController()?.toggleLeft()
////            } else {
////                let previousSelectedIndex = selectedSideMenu.rawValue
////                selectedSideMenu = .Profile
////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
////                self.slideMenuController()?.toggleLeft()
////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = profileVC
////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
////            }
////        case 2:
////
////            let activeDeliveryVC = self.storyboard?.instantiateViewController(withIdentifier: "OpenDeliveryVC") as! OpenDeliveryVC
////            if lastVC is ActiveDeliveryVC {
////                self.slideMenuController()?.toggleLeft()
////            } else {
////                let previousSelectedIndex = selectedSideMenu.rawValue
////                selectedSideMenu = .ActiveDelivery
////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
////                self.slideMenuController()?.toggleLeft()
////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = activeDeliveryVC
////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
////            }
//////        case 3:
//////            let openDeliveryVC = self.storyboard?.instantiateViewController(withIdentifier: "OpenDeliveryVC") as! OpenDeliveryVC
//////            if lastVC is OpenDeliveryVC {
//////                self.slideMenuController()?.toggleLeft()
//////            } else {
//////                let previousSelectedIndex = selectedSideMenu.rawValue
//////                selectedSideMenu = .OpenDelivery
//////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
//////                self.slideMenuController()?.toggleLeft()
//////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = openDeliveryVC
//////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
//////            }
////        case 3:
////            let deliveryHistoryVC = self.storyboard?.instantiateViewController(withIdentifier: "DeliveryHistoryVC") as! DeliveryHistoryVC
////            if lastVC is DeliveryHistoryVC {
////                self.slideMenuController()?.toggleLeft()
////            } else {
////                let previousSelectedIndex = selectedSideMenu.rawValue
////                selectedSideMenu = .DeliveryHistory
////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
////                self.slideMenuController()?.toggleLeft()
////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = deliveryHistoryVC
////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
////            }
////        case 4:
////            let myDashboardVC = self.storyboard?.instantiateViewController(withIdentifier: "MyDashboardVC") as! MyDashboardVC
////            if lastVC is MyDashboardVC {
////                self.slideMenuController()?.toggleLeft()
////            } else {
////                let previousSelectedIndex = selectedSideMenu.rawValue
////                selectedSideMenu = .MyDashboard
////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
////                self.slideMenuController()?.toggleLeft()
////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = myDashboardVC
////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
////            }
////        case 5:
////            let resetPasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
////            if lastVC is ResetPasswordVC {
////                self.slideMenuController()?.toggleLeft()
////            } else {
////                let previousSelectedIndex = selectedSideMenu.rawValue
////                selectedSideMenu = .ResetPassword
////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
////                self.slideMenuController()?.toggleLeft()
////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = resetPasswordVC
////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
////            }
////
////        case 6:
////
////
////            let setting = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
////
////            if lastVC is SettingVC {
////                self.slideMenuController()?.toggleLeft()
////            } else {
////                let previousSelectedIndex = selectedSideMenu.rawValue
////                selectedSideMenu = .EnableTouchId
////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
////                self.slideMenuController()?.toggleLeft()
////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = setting
////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
////            }
////
////
//////            let istouchIdEnable  = SSCommonClass.getUserDefaultForKey(key: UserDefaultsKey.touchIdEnabel.rawValue)
//////            if(istouchIdEnable != nil && istouchIdEnable as! String == "yes"){
//////                SSCommonClass.alertPermissionMessage(message: "Do you want to disable Login with TouchID?", viewController: self, callback: { (boolValue) in
//////                    if boolValue == true{
//////                        self.authenticateUsingTouchID()
//////                    }
//////                })
//////
//////            }
//////            else{
//////                SSCommonClass.alertPermissionMessage(message: "Do you want to Enable Login with TouchID?", viewController: self, callback: { (boolValue) in
//////                    if boolValue == true{
//////                        self.authenticateUsingTouchID()
//////                    }
//////                })
//////
//////            }
////        case 7:
////            //            SSCommonClass.alertMessage(message: "Under Development", viewController: self)
////            let contactsVC = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsVC") as! ContactUsVC
////            if lastVC is ContactsVC {
////                self.slideMenuController()?.toggleLeft()
////            } else {
////                let previousSelectedIndex = selectedSideMenu.rawValue
////                selectedSideMenu = .Contact
////                self.sidePanelTableView.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: UITableViewRowAnimation.none)
////                self.slideMenuController()?.toggleLeft()
////                SharedAppDelegate.parentNavigationController?.viewControllers[0] = contactsVC
////                SharedAppDelegate.parentNavigationController!.popToRootViewController(animated: true)
////            }
////
////
//        default:
////            SSCommonClass.alertPermissionMessage(message: "Are you sure you want to log out?", viewController: self, callback: { (boolValue) in
////                if boolValue == true{
////                    self.serviceLogout()
////                }
////            })
//            break
//        }
//    }



    
    
    
    
    
    
    
    //MARK:
    //MARK:-ServiceLogout
//    func serviceLogout (){
//        if SSAFNetworking.isConnectedToNetwork {
//            guard let userId = SSCommonClass.getUserDefaultForKey(key:UserDefaultsKey.userId.rawValue) as? String  else {
//                SSCommonClass.ToastShowMessage(msg: NSLocalizedString("Device Id Getting Error!", comment: ""),viewController:self)
//                return
//            }
//
//            let sessionToken =   SSCommonClass.getUserDefaultForKey(key: UserDefaultsKey.sessionToken.rawValue) as! String
//
//
//            let params:JSONDictionary =
//                [ kParamUser_id: userId,
//                  kParamDevice_id: SSCommonClass.getUserDefaultForKey(key: UserDefaultsKey.deviceId.rawValue) as? String ?? "",
//                  kParamDevice_token:SSCommonClass.getUserDefaultForKey(key: UserDefaultsKey.deviceToken.rawValue) as? String ?? "",
//                  kParamDevice_type:"2",
//                  ksession_token    : sessionToken,
//            ]
//            SSCommonClass.showProgress(loadingText: "")
//            SSWebServiceManager.WebServiceLogout(params: params, webServiceSuccess: { (response) in
//                print("\n\nLOGOUT RESPONSE\n\n \(response)")
//
//                let response_invalid = response.dictionary?["data"]?["response_invalid"].intValue
//                if(response_invalid == 0){
//
//
//                if let response_status_code = response.dictionary?["data"]?["status"].intValue{
//                    if response_status_code == 1{
//                        if let  _ = SSCommonClass.getUserDefaultForKey(key: UserDefaultsKey.userId.rawValue) as? String{
//                            SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.userId.rawValue)
//                        }
//                        DispatchQueue.global(qos: .background).async {
//                            DispatchQueue.main.async {
//
//                                SidePanelVC.clearUserDefault()
//
//                                SidePanelVC.sendToLogin()
//
////                                 Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(SidePanelVC.sendToLogin), userInfo: nil, repeats: false)
//                            }
//                        }
//                    }
//                    if response_status_code == 0{
//                        SSCommonClass.dismissProgress()
//                        SSCommonClass.ToastShowMessage(msg: (response.dictionary?["data"]?["msg"].string)!, viewController: self)
//                    }
//                }
//
//                }
//                else{
//
//                    SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.userId.rawValue)
//                    SidePanelVC.clearUserDefault()
//                    SidePanelVC.sendToLogin()
//
//                }
//
//            }, webServiceFailure: { (error) in
//                SSCommonClass.dismissProgress()
//                print("Error- \(error)")
//            })
//        }
//        else{
//            SSCommonClass.ToastShowMessage(msg: AppConstants.NoInternetMessage,viewController:self)
//        }
//    }

    
//   class func clearUserDefault(){
//
//
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.name.rawValue)
//         SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.profilePic.rawValue)
//         SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.sessionToken.rawValue)
////         SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.lattitude.rawValue)
////         SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.longitude.rawValue)
//         SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.address.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.firstName.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.lastName.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.fullProfilePic.rawValue)
////        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.deviceId.rawValue)
////        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.deviceToken.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.fullProfilePic.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.userId.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.company.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.countryCode.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.carRegistration.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.carInsurance.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.mobileVerified.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.city.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.emailVerified.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.region.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.country.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.driverLicense.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.pincode.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.heavyOversizedPackage.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.vehicleConfig.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.OTP.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.driverId.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.availability.rawValue)
//        SSCommonClass.saveUserDefault(object: "", key: UserDefaultsKey.profile_status.rawValue)
//
//
//
//    }

    
    
    //MARK: Go to login page
    //:-
// class func sendToLogin(){
//        SSCommonClass.dismissProgress()
//        let vc = mainStoryboardObj.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//        SharedAppDelegate.parentNavigationController = UINavigationController(rootViewController: vc)
//        SharedAppDelegate.parentNavigationController?.isNavigationBarHidden = true
//        guard let window = UIApplication.shared.keyWindow else {
//            return
//        }
//        UIView.transition(with:window, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
//            SharedAppDelegate.window?.rootViewController = SharedAppDelegate.parentNavigationController
//            SharedAppDelegate.window?.makeKeyAndVisible()
//        }, completion: nil)
//    }
//}

