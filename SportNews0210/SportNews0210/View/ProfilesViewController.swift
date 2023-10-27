//
//  ProfilesViewController.swift
//  SportNews0210
//
//  Created by Minh Triet Pham on 27/10/2023.
//

import UIKit

class ProfilesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func buttonLogOutTapped(_ sender: Any) {
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
           // to do
            scene.setupRootViewWelcome()
        }
    }
    
}
