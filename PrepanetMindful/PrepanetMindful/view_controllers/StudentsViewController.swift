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
    
    var student: Student!
    
    var courseIndex: Int!
    var studentList: [StudentCourse]=[]
    
    var renderedList: [StudentCourse]=[]
    
    var studentIndex = -1
    
    
    @IBOutlet weak var searchButton: UIImageView!
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Monterrey", "Guadalajara", "Santa Fe", "Cuernavaca", "Ciudad de México"]
        return menu
    }()
    func filter(searchId: String, students: [StudentCourse]) -> [StudentCourse] {
            let regex = "\(searchId)[a-zA-Z0-9]*"
            return students.filter({
                return $0.student.id.matches(regex)
            })
        }
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        renderedList=filter(searchId: tfSearch.text!,
                            students: studentList)
        self.tableView.reloadData()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(gesture:)))
        searchButton.addGestureRecognizer(tapGesture)
        searchButton.isUserInteractionEnabled=true
        
        vwSearchBackground.round(cornerRadius: 25.0, borderWidth: 1, borderColor: .black)
        
        // if usario.nacional
        dropDownSetup()
        
        
        
        let model=PrepanetMindfulModel()
        model.obtenerListaDeAlumnos(curso: courseIndex, campus: "0",{(studentsC:[StudentCourse]) in
            print("count:")
            print(studentsC)
            for studentC in studentsC{
                self.studentList.append(studentC)
                self.renderedList=self.studentList
                self.tableView.reloadData()
            }
        })
    }
    
    @objc func didTapItem() { menu.show() }
    
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
    
    @IBAction func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! ProfileViewController
        nextView.student = renderedList[studentIndex].student
        nextView.courses = renderedList[studentIndex].userCourseResults
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentIndex = indexPath.row
        performSegue(withIdentifier: "showStudent", sender: self)
    }
    
    // MARK: - Custom Cell
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return renderedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStudent", for: indexPath) as! StudentTableViewCell
                
        let cstudent=renderedList[indexPath.row]
        cell.lbId.text = cstudent.student.id
        cell.lbName.text = cstudent.student.name
        
        cell.setStatus(status: cstudent.userCourseResults[cstudent.currentCourse].status)
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }

}
