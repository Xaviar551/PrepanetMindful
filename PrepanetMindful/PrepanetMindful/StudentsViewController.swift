//
//  StudentsViewController.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/11/21.
//

import DropDown
import UIKit

class StudentsViewController: UIViewController, UITableViewDataSource,
    UITableViewDelegate {
    
    @IBOutlet weak var vwCampusBackground: UIView!
    @IBOutlet weak var lbCampus: UILabel!
    @IBOutlet weak var lbPeriod: UILabel!
    @IBOutlet weak var vwSearchBackground: UIView!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // var students: [Student] = []
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Monterrey", "Guadalajara", "Santa Fe", "Cuernavaca", "Ciudad de México"]
        return menu
    }()
    
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
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        vwSearchBackground.round(cornerRadius: 25.0, borderWidth: 1, borderColor: .black)
        
        menu.anchorView = vwCampusBackground
        menu.bottomOffset = CGPoint(x: 0, y: (menu.anchorView?.plainView.bounds.height)!)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapItem))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        vwCampusBackground.addGestureRecognizer(gesture)
        
        menu.selectionAction = { index, title in
            self.lbCampus.text = "Campus \(title)"
        }
    }
    
    @objc func didTapItem() {
        menu.show()
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
        
        let status = Int.random(in: 0...2)
        switch status {
        case 0:
            cell.lbStatusLetter.text = "A"
            cell.statusCircle.tintColor = .systemBlue
        case 1:
            cell.lbStatusLetter.text = "NA"
            cell.statusCircle.tintColor = .systemRed
        case 2:
            cell.lbStatusLetter.text = "C"
            cell.statusCircle.tintColor = .systemYellow
        default:
            cell.lbStatusLetter.text = "P"
            cell.statusCircle.tintColor = .systemGray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }

}
