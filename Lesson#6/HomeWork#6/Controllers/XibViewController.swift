//
//  XIBViewController.swift
//  HomeWork#6
//
//  Created by Andrey on 14.03.2022.
//

import UIKit

class XIBViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let course = courseList

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "XIBCourseTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseID")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openVCModaly))
    }
    
    @objc func openVCModaly() {
        let modalyVC = OpenViewController()
        modalyVC.modalPresentationStyle = .pageSheet
        present(modalyVC, animated: true, completion: nil)
    }
    
}

extension XIBViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseID", for: indexPath) as! XIBCourseTableViewCell
        cell.setup(model: course[indexPath.row])
        return cell
    }
    
    
}
