//
//  AddNotifViewController.swift
//  P1 BUSINESS
//
//  Created by Hui Lin on 24/1/18.
//  Copyright © 2018 Hui Lin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddNotifViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var branchAddNotif: UITextField!
    @IBOutlet weak var titleAddNotif: UITextField!
    @IBOutlet weak var descAddNotif: UITextView!
    @IBOutlet weak var repeatAddNotif: UITextField!
    
    @IBOutlet weak var branchPicker: UIPickerView!
    @IBOutlet weak var repeatPicker: UIPickerView!
    
    var branches = ["Jurong East", "Clementi", "Tampines", "Sentosa", "Serangoon"]
    var repeats = ["No repeat", "Everyday", "Weekdays", "Weekends"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countRows : Int = branches.count
        if (pickerView == repeatPicker) {
            countRows = self.repeats.count
        }
        return countRows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == branchPicker) {
            let titleRow = branches[row]
            return titleRow
        }
        else if (pickerView == repeatPicker) {
            let titleRow = repeats[row]
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == branchPicker) {
            self.branchAddNotif.text = self.branches[row]
            pickerView.isHidden = true
        }
        else if (pickerView == repeatPicker) {
            self.repeatAddNotif.text = self.repeats[row]
            pickerView.isHidden = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == branchAddNotif) {
            branchPicker.isHidden = false
        }
        else if (textField == repeatAddNotif) {
            repeatPicker.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        branchAddNotif.layer.borderWidth = 1
        titleAddNotif.layer.borderWidth = 1
        descAddNotif.layer.borderWidth = 1
        repeatAddNotif.layer.borderWidth = 1
        
        branchAddNotif.layer.borderColor = UIColor.lightGray.cgColor
        titleAddNotif.layer.borderColor = UIColor.lightGray.cgColor
        descAddNotif.layer.borderColor = UIColor.lightGray.cgColor
        repeatAddNotif.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNotif(_ sender: UIButton) {
        let ref = Database.database().reference()
        let notifRef = ref.child("notifications").child(Auth.auth().currentUser!.uid)
        let newNotifRef = notifRef.childByAutoId()
        
        newNotifRef.setValue([
            "branch": self.branchAddNotif.text,
            "title": self.titleAddNotif.text,
            "description": self.descAddNotif.text,
            "repeat": self.repeatAddNotif.text])
        
        branchAddNotif.text = ""
        titleAddNotif.text = ""
        descAddNotif.text = ""
        repeatAddNotif.text = ""
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
