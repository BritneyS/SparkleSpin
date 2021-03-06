//
//  HomeViewController.swift
//  SparkleSpin
//
//  Created by Britney Smith on 3/5/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func startButtonIsTapped(_ sender: LightButton) {
        sender.animateButton()
    }

}
