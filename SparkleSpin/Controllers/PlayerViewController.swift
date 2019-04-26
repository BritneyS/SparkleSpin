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
    
    @objc let playerViewModel = PlayerViewModel()
    var doneBarButton: UIBarButtonItem?
    var playerViewModelObservationToken: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        registerNib()
        setupTableView()
        addDoneBarButtonItem()
        playerViewModelObservationToken = observe(\.playerViewModel.playerList, options: [.new], changeHandler: { [unowned self](vc, change) in
            if change.newValue!.isEmpty {
                vc.doneBarButton?.isEnabled = false
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Invalidate observation tokens to stop observing
        playerViewModelObservationToken?.invalidate()
    }
    
    private func setNavigationBarTitle() {
        navigationItem.title = "Add Players!"
    }
    
    private func addDoneBarButtonItem() {
        doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = doneBarButton
        doneBarButton?.isEnabled = false
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
    
    private func registerNib() {
        let entryCell = UINib(nibName: NibID.entryCell, bundle: nil)
        playerTableView.register(entryCell, forCellReuseIdentifier: CellID.entryCell)
    }
    
    private func addPlayerToList() {
        let nameEntry = playerEntryTextField.text ?? ""
        playerViewModel.savePlayerEntry(name: nameEntry)
        playerEntryTextField.text? = ""
    }
    
    private func updateDoneBarButton() {
        if doneBarButton?.isEnabled == false {
            doneBarButton?.isEnabled = true
        }
    }
    
    private func insertNewPlayerRowInTable() {
        playerTableView.beginUpdates()
        let nextRowIndexPath = IndexPath(row: playerViewModel.playerList.count - 1, section: 0)
        playerTableView.insertRows(at: [nextRowIndexPath], with: .bottom)
        playerTableView.endUpdates()
    }
    
    private func alertForEmptyEntry() {
        let emptyEntryAlert = UIAlertController(title: "Oops!", message: "Entry cannot be blank!", preferredStyle: .alert)
        emptyEntryAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(emptyEntryAlert, animated: true)
    }
    
    @IBAction func userTappedAddButton(_ sender: LightButton) {
        addPlayerButton.animateButton()
        guard let playerEntryText = playerEntryTextField.text else { return }
        if !playerEntryText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            addPlayerToList()
            updateDoneBarButton()
            insertNewPlayerRowInTable()
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
        playerViewModel.playerList[indexPath.row].isSelected = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        playerViewModel.playerList[indexPath.row].isSelected = false
    }
}
