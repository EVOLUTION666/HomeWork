//
//  ViewController.swift
//  HomeWork#7
//
//  Created by Andrey on 17.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var jenreArray = jenresList
    
    var hiddenSections = Set<Int>()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomAlbumCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerIdentifier")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Music Album"
        view.addSubview(tableView)
    }
    
    @objc func didTapArrow(button: UIButton) {
        let section = button.tag
        jenreArray[section].isOpened.toggle()
        
        UIView.animate(withDuration: 0.2) {
            (self.tableView.headerView(forSection: section) as? CustomHeaderView)?.sectionButton.transform = self.jenreArray[section].isOpened ? .identity : CGAffineTransform(rotationAngle: .pi)
        }
        
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            
            for row in 0..<jenreArray[section].album.count {
                indexPaths.append(IndexPath(row: row, section: section))
            }
            return indexPaths
        }
        
        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
            self.tableView.insertRows(at: indexPathsForSection(), with: .fade)
            
        } else {
            self.hiddenSections.insert(section)
            self.tableView.deleteRows(at: indexPathsForSection(), with: .fade)
        }
        
    }
}
