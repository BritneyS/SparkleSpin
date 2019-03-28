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
    
    lazy var playerListViewModel: PlayerListViewModel = {
        return PlayerListViewModel(playerListModel: PlayerListModel(playerList: []))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        registerNib()
        setupTableView()
        setAddBarButtonItem()
    
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
    
    func registerNib() {
        let entryCell = UINib(nibName: NibID.entryCell, bundle: nil)
        playerTableView.register(entryCell, forCellReuseIdentifier: CellID.entryCell)
    }
    
    func setAddBarButtonItem() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlayerCell))
        navigationItem.rightBarButtonItem = addBarButtonItem
    }
    
    @objc func addPlayerCell() {
        
        let currentIndexPath = IndexPath(row: playerListViewModel.getPlayerList().count - 1, section: 0)
        let currentCell = playerTableView.cellForRow(at: currentIndexPath) as? EntryCell
        let nameEntry = currentCell?.entryTextField.text ?? ""
        let playerToAdd = playerListViewModel.createPlayerWith(name: nameEntry)
        
        playerListViewModel.addPlayerToPlayerList(player: playerToAdd)
        print("🍕 Datasource count: \(playerListViewModel.getPlayerList().count)")
        
        playerTableView.beginUpdates()
        let nextRowIndexPath = IndexPath(row: playerListViewModel.getPlayerList().count - 1, section: 0)
        playerTableView.insertRows(at: [nextRowIndexPath], with: .bottom)
        playerTableView.endUpdates()
        
        for player in playerListViewModel.getPlayerList() {
            print("🐶 \(player.name)")
        }
    }
}

extension PlayerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.entryCellRowHeight)
    }
}

extension PlayerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("🐶 Datasource count: \(playerListViewModel.getPlayerList().count)")
        return playerListViewModel.getPlayerList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: CellID.entryCell, for: indexPath) as? EntryCell else { fatalError("Fatal error: No cell") }
        return entryCell
    }
}


