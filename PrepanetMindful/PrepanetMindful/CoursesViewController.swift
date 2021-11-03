//
//  CoursesViewController.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 02/11/21.
//

import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var stackViewCourses: UIStackView!
    var talleres: [Taller] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        talleres.append(Taller(id: "202619", nombre: "Liderazgo Positivo y Transformación Social", descripcion: "Descripcion de Liderazgo Positivo y Transformación Social"))
        talleres.append(Taller(id: "202620", nombre: "Mis habilidades y motivaciones", descripcion: "Descripcion de Español"))
        talleres.append(Taller(id: "202621", nombre: "Mis emociones", descripcion: "Descripcion de ciencias"))
        talleres.append(Taller(id: "202622", nombre: "Mis relaciones", descripcion: "Descripcion de programacion"))
        talleres.append(Taller(id: "202623", nombre: "Mis áreas de oportunidad", descripcion: "Descripcion de fisica"))
        talleres.append(Taller(id: "202624", nombre: "Mis metas", descripcion: "Descripcion de historia"))
        for taller in talleres {
            let myView = CourseView(taller: taller)
            stackViewCourses.addArrangedSubview(myView)
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

}
