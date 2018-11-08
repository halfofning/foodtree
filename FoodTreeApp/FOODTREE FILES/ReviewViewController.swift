//
//  ReviewViewController.swift
//  P1 BUSINESS
//
//  Created by Hui Lin on 24/1/18.
//  Copyright © 2018 Hui Lin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ReviewViewController: UIViewController {

    @IBOutlet weak var nameReview: UITextField!
    @IBOutlet weak var emailReview: UITextField!
    @IBOutlet weak var contentReview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameReview.layer.borderWidth = 1
        emailReview.layer.borderWidth = 1
        contentReview.layer.borderWidth = 1
        nameReview.layer.borderColor = UIColor.lightGray.cgColor
        emailReview.layer.borderColor = UIColor.lightGray.cgColor
        contentReview.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitFeedback(_ sender: UIButton) {
        let ref = Database.database().reference()
        let feedbackRef = ref.child("feedback")
        let newFeedbackRef = feedbackRef.childByAutoId()
        let user = Auth.auth().currentUser
        if (nameReview.text != "" || emailReview.text != "" || contentReview.text != "") {
            newFeedbackRef.setValue([
                "uid": user?.uid,
                "name": self.nameReview.text,
                "email": self.emailReview.text,
                "feedback": self.contentReview.text])
        }
        nameReview.text = "";
        emailReview.text = "";
        contentReview.text = "";
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
