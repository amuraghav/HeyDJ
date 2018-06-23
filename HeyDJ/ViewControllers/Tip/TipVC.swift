//
//  TipVC.swift
//  HeyDJ
//
//  Created by Pankajr on 23/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit

class TipVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnAction(_ sender: Any) {
       SharedAppDelegate.parentNavigationController?.popToRootViewController(animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
