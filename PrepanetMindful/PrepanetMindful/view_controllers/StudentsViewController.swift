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
    
    //var students
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        vwSearchBackground.round(cornerRadius: 25.0, borderWidth: 1, borderColor: .black)
        dropDownSetup()
    }
    
    @objc func didTapItem() {
        menu.show()
    }
    
    func dropDownSetup() {
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
        cell.setStatus(status: status)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }

}
