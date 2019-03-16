//
//  HomeViewController.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/5/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func startButtonIsTapped(_ sender: LightButton) {
        sender.animateButton()
    }

}
