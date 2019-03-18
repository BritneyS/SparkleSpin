//
//  PlayerViewController.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/16/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        registerNib()
        setupTableView()
    
    }
    
    private func setNavigationBarTitle() {
        navigationItem.title = "Choose Players!"
    }
    
    private func setupTableView() {
        playerTableView.dataSource = self
        playerTableView.delegate = self
        playerTableView.backgroundColor = ThemeColor.Light.primaryColor
        playerTableView.separatorStyle = .none
        playerTableView.rowHeight = UITableView.automaticDimension
        playerTableView.estimatedRowHeight = CGFloat(Constants.estimatedRowHeight)
        playerTableView.tableFooterView = UIView()
    }

}

extension PlayerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func registerNib() {
        let entryCell = UINib(nibName: NibID.entryCell, bundle: nil)
        playerTableView.register(entryCell, forCellReuseIdentifier: CellID.entryCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: CellID.entryCell, for: indexPath) as? EntryCell else { fatalError("Fatal error: No cell") }
        return entryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.entryCellRowHeight)
    }
    
    
}
