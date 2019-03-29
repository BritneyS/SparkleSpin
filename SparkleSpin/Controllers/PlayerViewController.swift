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
        currentCell?.setCellStateTo(cellState: .saved)
        print("🍕 Datasource count: \(playerListViewModel.getPlayerList().count)")
        
        playerTableView.beginUpdates()
        let nextRowIndexPath = IndexPath(row: playerListViewModel.getPlayerList().count - 1, section: 0)
        let nextCell = playerTableView.cellForRow(at: nextRowIndexPath) as? EntryCell
        playerTableView.insertRows(at: [nextRowIndexPath], with: .bottom)
        nextCell?.setCellStateTo(cellState: .entering)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) as? EntryCell else { fatalError("Fatal error: No cell") }
        selectedCell.setCellStateTo(cellState: .selected)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let deselectedCell = tableView.cellForRow(at: indexPath) as? EntryCell else { fatalError("Fatal error: No cell") }
        deselectedCell.setCellStateTo(cellState: .saved)
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


