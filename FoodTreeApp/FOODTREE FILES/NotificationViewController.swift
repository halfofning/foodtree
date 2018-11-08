//
//  NotificationViewController.swift
//  
//
//  Created by Hui Lin on 24/1/18.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    var notificationList = [Notification]()
    var currentUser = Auth.auth().currentUser

    @IBOutlet weak var tableView: UITableView!
    
    var notifications = [AnyObject?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        fetchNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotifTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotifTableViewCell
        
        return cell
        
    }
    
    func fetchNotifications() {
        _ = ref.child("notifications").child(currentUser!.uid).observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                print(dictionary)
                
                let notification = Notification()
                
                notification.setValuesForKeys(dictionary)
                
                self.notificationList.append(notification)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
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
