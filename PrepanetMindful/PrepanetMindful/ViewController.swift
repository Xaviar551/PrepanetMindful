//
//  ViewController.swift
//  PrepanetMindful
//
//  Created by user207679 on 10/21/21.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

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
        let model=PrepanetMindfulModel()
        print(model.getUid())
        //iniciarSesion(usuario: "prietojavi551@gmail.com", contrasena: "dummypass1234")
        //Auth.auth().signIn(withEmail: "prietojavi551@gmail.com", password: "dummypass1234"){ [weak self] authResult, error in
        //    guard let strongSelf = self else {
        //        print("nah")
        //        return }
        //    print("it kinda workds" )
        //}
        model.iniciarSesion(usuario: "prietojavi551@gmail.com", contrasena: "dummypass1234", {()->Void in
            print("Signing in...")
        })
        
        /*let db = Firestore.firestore()
                    let docRef = db.collection("talleres").getDocuments(){(querySnap, err) in
                        var count=0
                        for doc in querySnap!.documents{
                            print(doc.data())
                            /*self.courses[count].name=doc.data()["name"] as! String
                            self.courses[count].courseDescription=doc.data()["description"] as! String
                            self.tableView.reloadData()
                            count+=1*/
                        }
                    }*/
    }
    
}
