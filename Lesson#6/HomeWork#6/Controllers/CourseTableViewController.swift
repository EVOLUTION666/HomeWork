//
//  CourseTableViewController.swift
//  HomeWork#6
//
//  Created by Andrey on 09.03.2022.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    var allCourse = courseList
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CourseTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.backgroundColor = UIColor(red: 223/255,
                                            green: 222/255,
                                            blue: 226/255,
                                            alpha: 1)
        tableView.separatorStyle = .none
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openVC))
    }
    
    
    
    @objc func openVC() {
        let modalVC = OpenViewController()
        modalVC.view.alpha = 0.6
        present(modalVC, animated: true)
    }
    
    @objc func pressAddButton() {
        let rootVC = UINavigationController(rootViewController: CourseTableViewController())
        rootVC.present(NavViewController(), animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCourse.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CourseTableViewCell
        let courseInCell = allCourse[indexPath.row]
        
        cell.addButton.addTarget(self, action: #selector(pressAddButton), for: .touchUpInside)
        
        cell.setup(model: courseInCell)

        return cell
    }
}
