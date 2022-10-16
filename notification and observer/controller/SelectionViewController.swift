//
//  SelectionViewController.swift
//  notification and observer
//
//  Created by Dhaval Dobariya on 26/01/22.
//

import UIKit

class SelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func headButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: headNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tailButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: tailNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
