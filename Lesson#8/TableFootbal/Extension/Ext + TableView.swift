//
//  Ext + TableView.swift
//  TableFootbal
//
//  Created by Andrey on 17.03.2022.
//

import UIKit

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ligueArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ligueArray[section].teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let oneSection = ligueArray[indexPath.section]
        cell.textLabel?.text = oneSection.teams[indexPath.row].teamName
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            ligueArray[indexPath.section].teams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if ligueArray[indexPath.section].teams.isEmpty {
                ligueArray.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .fade)
            }
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        ligueArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomHeaderView()
        
        headerView.addButton.tag = section
        headerView.ligueName.text = ligueArray[section].ligueName
        headerView.addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        
        return headerView
    }
}
