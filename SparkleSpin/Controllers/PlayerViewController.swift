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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNavigationBarTitle()
    }
    
    private func setNavigationBarTitle() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.topItem?.title = "Choose Players!"
    }

}
