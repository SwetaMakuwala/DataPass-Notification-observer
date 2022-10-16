//
//  ViewController.swift
//  notification and observer
//
//  Created by Dhaval Dobariya on 26/01/22.
//

import UIKit
let headNotificationKey = "co.sweta.headSide"
let tailNotificationKey = "co.sweta.tailSide"
class ViewController: UIViewController {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var  nameLabel: UILabel!
    let head = Notification.Name(rawValue: headNotificationKey)
    let tail = Notification.Name(rawValue: tailNotificationKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeImageRound()
        createObserve()
        // Do any additional setup after loading the view.
    }
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func chooseButtonTapped(_ sender: UIButton){
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
     selectionVC.modalPresentationStyle = .fullScreen
        present(selectionVC, animated: true, completion: nil)
    }
    
}

extension ViewController {
    func makeImageRound(){
        mainImageView.layer.cornerRadius = mainImageView.frame.width / 2
        mainImageView.layer.borderWidth = 1
        mainImageView.layer.borderColor = UIColor.black.cgColor
    }
    // creating observer:
    func createObserve(){
        // head
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateImage(notification:)), name: head, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateNameLabel(notification:)), name: head, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateBackground(notification:)), name: head, object: nil)
        // tail
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateImage(notification:)), name: tail, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateNameLabel(notification:)), name: tail, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateBackground(notification:)), name: tail, object: nil)
    }
    @objc func updateImage(notification: NSNotification){
        let isHead = notification.name == head
        let image = isHead ? UIImage(named: "head") : UIImage(named: "tail")
        mainImageView.image = image
    }
    @objc func updateNameLabel(notification: NSNotification){
        let isHead = notification.name == head
        nameLabel.text = isHead ? "Head is Selected" : "Tail is Selected"
        
    }
    @objc  func updateBackground(notification: NSNotification){
        let isHead = notification.name == head
        view.backgroundColor = isHead ? UIColor.cyan : UIColor.red
    }
    
}
