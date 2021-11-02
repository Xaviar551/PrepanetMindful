//
//  ViewController.swift
//  PrepanetMindful
//
//  Created by user207679 on 10/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var vwUser: UIView!
    @IBOutlet weak var vwPassword: UIView!
    
    func prepareView() {
        btnLogin.layer.cornerRadius = 15.0
        btnLogin.layer.borderWidth = 2.0
        btnLogin.layer.borderColor = UIColor.systemGray.cgColor
        btnLogin.clipsToBounds = true;
        tfUser.layer.cornerRadius = 15.0
        tfUser.layer.borderWidth = 2.0
        tfUser.layer.borderColor = UIColor.systemGray.cgColor
        tfPassword.layer.cornerRadius = 15.0
        tfPassword.layer.borderWidth = 2.0
        tfPassword.layer.borderColor = UIColor.systemGray.cgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //prepareView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.container.round(cornerRadius: 25.0, borderWidth: 2.0, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        self.vwUser.round(cornerRadius: self.vwUser.frame.size.height/2, borderWidth: 1.0, borderColor: UIColor.systemGray)
        self.vwPassword.round(cornerRadius: self.vwPassword.frame.size.height/2, borderWidth: 1.0, borderColor: UIColor.systemGray)
        self.btnLogin.layer.cornerRadius = self.btnLogin.frame.size.height/2
        
    }
}

extension UIView {

    func round(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
}
