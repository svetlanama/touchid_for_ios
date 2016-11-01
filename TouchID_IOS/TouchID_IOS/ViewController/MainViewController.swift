//
//  MainViewController.swift
//  TouchID_IOS
//
//  Created by Svitlana Moiseyenko on 11/1/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var bLogout: UIButton!
    @IBAction func onLogout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
