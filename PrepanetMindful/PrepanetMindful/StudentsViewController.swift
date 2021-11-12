//
//  StudentsViewController.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/11/21.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDataSource,
    UITableViewDelegate {
    
    @IBOutlet weak var lbCampus: UILabel!
    @IBOutlet weak var lbPeriod: UILabel!
    @IBOutlet weak var vwSearchBackground: UIView!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // var students: [Student] = []
    
    var students = [
        Student(id:"A07045937" , name: "Fernanada Gonzalez Jimenez" , campus: "CSF"),
        Student(id:"A07045938" , name: "Johan Gadiel Garcia Marin", campus: "CSF"),
        Student(id:"A07045939" , name: "Abishai Enrique Del Castillo Vega", campus: "CSF"),
        Student(id:"A07045940" , name: "Daniela Cristal Lorenzo Blas", campus: "PUE"),
        Student(id:"A07045941" , name: "Abril Estefania Tun Kun", campus: "PUE"),
        Student(id:"A07045942" , name: "Edgar Leonardo Nuñez Garcia" , campus: "PUE"),
        Student(id:"A07045943" , name: "Nathali Guzman Santos", campus: "PUE"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vwSearchBackground.round(cornerRadius: 25.0, borderWidth: 1, borderColor: .black)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStudent", for: indexPath) as! StudentTableViewCell
        
        cell.lbId.text = students[indexPath.row].id
        cell.lbName.text = students[indexPath.row].name
        cell.lbStatusLetter.text = Int.random(in: 1...3) == 1 ? "A" : "NA"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }

}
