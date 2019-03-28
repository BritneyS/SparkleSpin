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
    
    var playerList: [PlayerModel] = []
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
        //playerList.append(PlayerModel(name: currentCell?.entryTextField.text))
        guard let currentCellText = currentCell?.entryTextField.text else { return }
        let playerToAdd = playerListViewModel.createPlayerWith(name: currentCellText)
        playerListViewModel.addPlayerToPlayerList(player: playerToAdd)
        playerTableView.beginUpdates()
        //playerTableView.insertRows(at: [IndexPath(row: playerList.count - 1, section: 0)], with: .bottom)
        playerTableView.insertRows(at: [IndexPath(row: playerListViewModel.getPlayerList().count - 1, section: 0)], with: .bottom)
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
//        if playerListViewModel.getPlayerList().count == 0 {
//            return 1
//        } else {
//            return playerListViewModel.getPlayerList().count
//        }
        print("🐶 Datasource count: \(playerListViewModel.getPlayerList().count)")
        return playerListViewModel.getPlayerList().count
        //return playerList.count
        
//        if playerList.count == 0 {
//            print("🐶 first cell")
//            return 1
//        } else {
//
//            print("😀 next cell")
//            return playerList.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: CellID.entryCell, for: indexPath) as? EntryCell else { fatalError("Fatal error: No cell") }
        return entryCell
    }
}


