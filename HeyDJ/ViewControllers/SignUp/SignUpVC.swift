//
//  SignUpVC.swift
//  HeyDJ
//
//  Created by Pankajr on 20/06/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit
import MICountryPicker

class SignUpVC: UIViewController,MICountryPickerDelegate {

    @IBOutlet weak var countryPickerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countryPickerAction(_ sender: Any) {
        
        let picker = MICountryPicker()
        picker.delegate = self
        
        // Optionally, set this to display the country calling codes after the names
        picker.showCallingCodes = true
        navigationController?.present(picker, animated: true, completion: nil)
    }
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String) {
        print(code)
        
    }
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        print(dialCode)
        countryPickerBtn.setTitle(dialCode, for: .normal)
        navigationController?.dismiss(animated: true, completion: nil)
        
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
