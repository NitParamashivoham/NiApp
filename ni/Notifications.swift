//
//  Notifications.swift
//  ni
//
//  Created by Nitesh on 2018-07-19.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit
import UserNotifications

class Notifications: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {didAllow, error in })

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
    @IBOutlet weak var localSwitch: UISwitch!
    @IBAction func localNotification(_ sender: UISwitch) {
        if localSwitch.isOn
        {
            var dateComponents = DateComponents()
            dateComponents.hour = 14
            dateComponents.minute = 46
                
            
              //  content.subtitle = ""
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let content = UNMutableNotificationContent()
            content.body = "Get back to inner space, remebr to meditate today."
            content.badge = 1
            content.title = "Meditation!"

            
            let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
    else
        {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification"])

        }
        
     
        
    
    }
        
    
    
}
