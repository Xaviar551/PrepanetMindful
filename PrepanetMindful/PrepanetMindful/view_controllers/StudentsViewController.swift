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
    
    var courseIndex: Int!
    var studentList: [StudentCourse]=[]
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
        
        
        let model=PrepanetMindfulModel()
        model.obtenerListaDeAlumnos(curso: courseIndex, campus: "1",{(studentsC:[StudentCourse]) in
            print("count:")
            print(studentsC)
            for studentC in studentsC{
                self.studentList.append(studentC)
                self.tableView.reloadData()
            }
        })
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
        return studentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStudent", for: indexPath) as! StudentTableViewCell
        
        let student=studentList[indexPath.row]
        cell.lbId.text = student.student.id
        cell.lbName.text = student.student.name
        
        let status = "P"
        cell.setStatus(status: student.userCourseResults[student.currentCourse].status)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        courseIndex=indexPath.row+1
        performSegue(withIdentifier: "showStudents", sender: tableView.cellForRow(at: indexPath))
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }

}
