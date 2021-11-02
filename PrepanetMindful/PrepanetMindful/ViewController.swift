//
//  ViewController.swift
//  PrepanetMindful
//
//  Created by user207679 on 10/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    func prepareView() {
        loginButton.layer.cornerRadius = 15.0
        loginButton.layer.borderWidth = 2.0
        loginButton.layer.borderColor = UIColor.systemGray.cgColor
        tfId.layer.cornerRadius = 15.0
        tfId.layer.borderWidth = 2.0
        tfId.layer.borderColor = UIColor.systemGray.cgColor
        tfPassword.layer.cornerRadius = 15.0
        tfPassword.layer.borderWidth = 2.0
        tfPassword.layer.borderColor = UIColor.systemGray.cgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareView()
        
    }


}

