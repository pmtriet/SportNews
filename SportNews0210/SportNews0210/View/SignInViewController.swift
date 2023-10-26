//
//  SignInViewController.swift
//  SportNews0210
//
//  Created by Minh Triet Pham on 04/10/2023.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var createAccountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let signUp = "or Create Account"
        let attributedString = NSMutableAttributedString(string: signUp)
        let range = (attributedString.string as NSString).range(of: "Create Account")
        attributedString.addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue], range: range)
        createAccountLabel.attributedText = attributedString
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        createAccountLabel.addGestureRecognizer(tapGestureRecognizer)
        createAccountLabel.isUserInteractionEnabled = true
        
    }
    
    @objc func labelTapped() {
        let signUp = SignUpViewController()
        navigationController?.pushViewController(signUp, animated: true)
       }
}
