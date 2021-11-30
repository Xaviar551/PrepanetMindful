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
    var userType: String=""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // container.round(cornerRadius: 25.0, borderWidth: 2.0, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        // Esquinas redondas
        container.layer.cornerRadius = 25.0
        
        //
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.3
        container.layer.shadowOffset = CGSize(width: 2, height: 3)
        container.layer.shadowRadius = 4.0
        container.layer.shadowPath = UIBezierPath(roundedRect: container.bounds.insetBy(dx: -3, dy: -4), cornerRadius: 25).cgPath
        
        container.clipsToBounds = false
        
        vwUser.round(cornerRadius: vwUser.frame.size.height/2, borderWidth: 1.0, borderColor: UIColor.systemGray)
        vwPassword.round(cornerRadius: vwPassword.frame.size.height/2, borderWidth: 1.0, borderColor: UIColor.systemGray)
        btnLogin.layer.cornerRadius = btnLogin.frame.size.height/2
        navigationController?.isNavigationBarHidden = true
    }
    func loginSegue(userType: String) -> Void{
        self.userType=userType
        performSegue(withIdentifier: "loginToCourses", sender: self)
        
    }
    @IBAction func loginPressed(_ sender: Any) {
        let model=PrepanetMindfulModel()
        model.iniciarSesion(usuario: tfUser.text!, contrasena: tfPassword.text!,loginSegue,{
            () in
            self.mostrarError("Error de Inicio de Sesion", "El usuario y/o contrasena son incorrectos.")
        })
    }
    private func mostrarError(_ title: String, _ mensaje: String){
        let alerta=UIAlertController(title: title, message: mensaje, preferredStyle: .alert)
        let botonOK=UIAlertAction(title:"OK",style: .cancel, handler: nil)
        alerta.addAction(botonOK)
        present(alerta, animated:true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! CoursesTableViewController
        nextView.typeOfUser = userType
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
