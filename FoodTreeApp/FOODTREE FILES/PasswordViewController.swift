//
//  PasswordViewController.swift
//  P1 BUSINESS
//
//  Created by Hui Lin on 31/1/18.
//  Copyright © 2018 Hui Lin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class PasswordViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    
    @IBAction func changeButton(_ sender: UIButton) {
        let user = Auth.auth().currentUser
        
        user?.updatePassword(to: password.text!, completion: { (error) in
            if (error != nil) {
                print(error!)
            }
            else {
                self.password.text = ""
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
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
