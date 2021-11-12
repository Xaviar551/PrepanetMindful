//
//  StudentsViewController.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/11/21.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDataSource,
    UITableViewDelegate {
    
    var students: [Student] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
