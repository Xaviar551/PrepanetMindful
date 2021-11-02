//
//  ViewController.swift
//  PrepanetMindful
//
//  Created by user207679 on 10/21/21.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    @IBOutlet weak var message: UITextField!
    let db=Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func writeDb(text: String){
        let docRef=db.document("PrepanetMindful/prueba")
        docRef.setData(["texto": text])
    }
    @IBAction func onButtonPressed(_ sender: Any) {
        writeDb(text: message.text!)
        
    }
    
}

