//
//  PlayerViewController.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/16/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
    }
    
    private func setNavigationBarTitle() {
        navigationItem.title = "Choose Players!"
    }

}
