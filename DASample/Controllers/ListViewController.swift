//
//  ListViewController.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UIActivityIndicatable {

    private(set) var items = [ListItem]()
    
    private var manager: ListItemsManager<ListViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        initUI()
        reload()
    }
    
    private func initialize() {
        manager = ListItemsManager(delegate: self)
        tableView.register(UINib(nibName: ListViewCell.identifier, bundle: nil), forCellReuseIdentifier: ListViewCell.identifier)
    }

    private func initUI() {
        addCloseButton()
        title = "List"
        tableView.separatorStyle = .none
        tableView.backgroundColor = .lightBackground
    }
    
    private func reload() {
        manager.fetch()
    }

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return items.count }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 0.01 }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { return 0.01 }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.identifier, for: indexPath) as? ListViewCell else { return UITableViewCell() }

        cell.item = items.element(at: indexPath.item)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListViewController: ListItemsDelegate {
    func didFetch(_ elements: [ListItem]) {
        items = elements
        tableView.reloadData()
    }
}
