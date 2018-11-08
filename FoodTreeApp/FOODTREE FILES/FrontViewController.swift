//
//  FrontViewController.swift
//  P1 BUSINESS
//
//  Created by Hui Lin on 24/1/18.
//  Copyright © 2018 Hui Lin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class FrontViewController: UIViewController {
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil {
                self.errorMessage.text = "Sign up sucessful"
                self.performSegue(withIdentifier: "signUp", sender: self)
                
                let userRef = self.ref.child("Users")
                userRef.child(user!.uid).child("email").setValue(self.email.text)
            }
            else {
                self.errorMessage.text = error?.localizedDescription
            }
        }
    }
    @IBAction func logIn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "signUp", sender: self)
                print(user!.email!)
            }
            else {
                if let myError = error?.localizedDescription {
                    print(myError)
                }
            }
        }
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
