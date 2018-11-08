//
//  StartViewController.swift
//  P1 BUSINESS
//
//  Created by Hui Lin on 25/1/18.
//  Copyright © 2018 Hui Lin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class StartViewController: UIViewController {

    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil {
                self.errorMessage.text = "Signed Up"
                
                Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!, completion: { (user, error) in
                    if error == nil {
                        print("hi")
                        let ref = Database.database().reference()
                        let userRef = ref.child("users")
                        let newUserRef = userRef.child(user!.uid)
                        newUserRef.setValue(["username": self.username.text, "email": self.email.text])
                        self.performSegue(withIdentifier: "login", sender: self)
                    }
                })
            }
            else {
                print(error!)
            }
        }
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil {
                self.errorMessage.text = "Logged In"
                self.performSegue(withIdentifier: "login", sender: self)
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
