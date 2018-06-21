//
//  ForgotPasswordVC.swift
//  HeyDJ
//
//  Created by Pankajr on 21/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
submitBtn.setButtonRadius()
        self.navigationController?.navigationBar.backItem?.title = nil
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitBtnAction(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MobileVerificationVC") as! MobileVerificationVC
        
        self.navigationController?.pushViewController(vc, animated: true)
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