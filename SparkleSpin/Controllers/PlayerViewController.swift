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
    @IBOutlet weak var playerEntryTextField: CustomTextField!
    @IBOutlet weak var addPlayerButton: LightButton! 
    
    let playerViewModel = PlayerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        registerNib()
        setupTableView()
        addDoneBarButtonItem()
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
    }
    
    private func addDoneBarButtonItem() {
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = doneBarButtonItem
    }
    
    private func registerNib() {
        let entryCell = UINib(nibName: NibID.entryCell, bundle: nil)
        playerTableView.register(entryCell, forCellReuseIdentifier: CellID.entryCell)
    }
    
    private func addPlayerToList() {
        let nameEntry = playerEntryTextField.text ?? ""
        var playerToAdd = playerViewModel.createPlayerWith(name: nameEntry)
        playerViewModel.addPlayerToSavedList(player: &playerToAdd)
        playerEntryTextField.text? = ""
    }
    
    func alertForEmptyEntry() {
        let emptyEntryAlert = UIAlertController(title: "Oops!", message: "Entry cannot be blank!", preferredStyle: .alert)
        emptyEntryAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(emptyEntryAlert, animated: true)
    }
    
    @IBAction func userTappedAddButton(_ sender: LightButton) {
        addPlayerButton.animateButton()
        guard let playerEntryText = playerEntryTextField.text else { return }
        if !playerEntryText.isEmpty {
            addPlayerToList()
            
            playerTableView.beginUpdates()
            let nextRowIndexPath = IndexPath(row: playerViewModel.items.count - 1, section: 0)
            let nextCell = playerTableView.cellForRow(at: nextRowIndexPath) as? EntryCell
            playerTableView.insertRows(at: [nextRowIndexPath], with: .bottom)
            nextCell?.setCellStateWith(state: .saved)
            playerTableView.endUpdates()
        } else {
            alertForEmptyEntry()
        }
    }
}

extension PlayerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.entryCellRowHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playerViewModel.items[indexPath.row].isSelected = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        playerViewModel.items[indexPath.row].isSelected = false
    }
}
