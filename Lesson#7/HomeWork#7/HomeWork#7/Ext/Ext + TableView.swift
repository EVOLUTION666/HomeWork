//
//  Ext + TableView.swift
//  HomeWork#7
//
//  Created by Andrey on 18.03.2022.
//

import UIKit

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return jenreArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hiddenSections.contains(section) {
            return 0
        }
        
        return jenreArray[section].album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomAlbumCell
        
        let oneAlbum = jenreArray[indexPath.section].album[indexPath.row]
        cell.setupModel(model: oneAlbum)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerIdentifier") as! CustomHeaderView
        
        headerView.sectionButton.tag = section
        headerView.sectionTitle.text = jenreArray[section].jenreName
        headerView.sectionButton.transform = self.jenreArray[section].isOpened ? .identity : CGAffineTransform(rotationAngle: .pi)
        headerView.sectionButton.addTarget(self, action: #selector(didTapArrow), for: .touchUpInside)
        
        return headerView
    }
    
}

