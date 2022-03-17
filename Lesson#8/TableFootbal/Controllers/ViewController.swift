//
//  ViewController.swift
//  TableFootbal
//
//  Created by Andrey on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var ligueArray = ligueList
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerReuseIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var editBarButton: UIBarButtonItem = {
        let editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapEdit))
        return editBarButton
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationItem.leftBarButtonItem = editBarButton
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Ligues"
    }
    
    @objc func didTapEdit() {
        if tableView.isEditing {
            tableView.isEditing = false
            editBarButton.title = "Edit"
            
        } else {
            tableView.isEditing = true
            editBarButton.title = "Cancel Edit"
        }
    }
    
    func showAlert(section: Int) {
        let alert = UIAlertController(title: "ADD TEAM", message: "Please, write name of team", preferredStyle: .alert)
        alert.addTextField { UITextField in
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] UIAlertAction in
            let teamName = (alert.textFields![0] as UITextField).text
            DispatchQueue.main.async {
                guard let self = self, let teamName = teamName else { return }
                let team = Teams.init(teamName: teamName)
                self.ligueArray[section].teams.append(team)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [IndexPath.init(row: self.ligueArray[section].teams.count - 1, section: section)], with: .fade)
                self.tableView.endUpdates()
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func didTapAdd(button: UIButton) {
        showAlert(section: button.tag)
    }
}


