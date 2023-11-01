//
//  ProfilesViewController.swift
//  SportNews0210
//
//  Created by Minh Triet Pham on 27/10/2023.
//

import UIKit

enum SettingsSection: Int {
    case app =  1
    case general = 2
    case resource = 3
}

let titleMenu: [String] = ["Preferred Platforms", "App Icon", "Privacy Policy", "Write a Review", "Share with a Friend", "Powered By IGDB"]


class ProfilesViewController: UITableViewController {

    let preferedPlayformIndexPath = IndexPath(row: 0, section: SettingsSection.app.rawValue)
    let appIconIndexPath = IndexPath(row: 1, section: SettingsSection.app.rawValue)
    
    let privacyPolicy = IndexPath(row: 0, section: SettingsSection.general.rawValue)
    let writeAReview = IndexPath(row: 1, section: SettingsSection.general.rawValue)
    
    let shareWithaFriend = IndexPath(row: 0, section: SettingsSection.resource.rawValue)
    let poweredByIGDB = IndexPath(row: 1, section: SettingsSection.resource.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutClicked(_ sender: Any) {
        AuthViewModel.shared.signOut()
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            // to do
            scene.setupRootViewWelcome()
        }
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ""
//    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleMenu[indexPath.row]
        return cell
    }
//    @IBAction func buttonLogOutTapped(_ sender: Any) {
//        AuthViewModel.shared.signOut()
//        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
//           // to do
//            scene.setupRootViewWelcome()
//        }
//    }
    
}



