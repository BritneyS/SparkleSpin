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
    let playerViewModel = PlayerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        registerNib()
        setupTableView()
        addBarButtonItem()
    }
    
    private func setNavigationBarTitle() {
        navigationItem.title = "Add Players!"
    }
    
    private func setupTableView() {
        playerTableView.dataSource = playerViewModel
        playerTableView.delegate = self
        playerTableView.backgroundColor = ThemeColor.Light.primaryColor
        playerTableView.separatorStyle = .none
        playerTableView.rowHeight = UITableView.automaticDimension
        playerTableView.estimatedRowHeight = CGFloat(Constants.estimatedRowHeight)
        playerTableView.tableFooterView = UIView()
        playerTableView.allowsMultipleSelection = true
    }
    
    private func addBarButtonItem() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlayer))
        navigationItem.rightBarButtonItem = addBarButtonItem
    }
    
    private func registerNib() {
        let entryCell = UINib(nibName: NibID.entryCell, bundle: nil)
        playerTableView.register(entryCell, forCellReuseIdentifier: CellID.entryCell)
    }
    
    @objc private func addPlayer() {
        let currentIndexPath = IndexPath(row: playerViewModel.items.count - 1, section: 0)
        let currentCell = playerTableView.cellForRow(at: currentIndexPath) as? EntryCell
        let nameEntry = currentCell?.entryTextField.text ?? ""
        
    }

}

extension PlayerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.entryCellRowHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playerViewModel.items[indexPath.row].isSaved = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        playerViewModel.items[indexPath.row].isSaved = false
    }
}
