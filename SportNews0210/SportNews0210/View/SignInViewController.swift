//
//  SignInViewController.swift
//  SportNews0210
//
//  Created by Minh Triet Pham on 04/10/2023.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
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
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard let email = userNameTextField.text, let password = passwordTextField.text else {
                    return
                }
                
                let user = UserInputData(email: email, password: password)
                
                AuthViewModel.shared.login(user: user) { result in
                    switch result {
                    case .success(let user):
                        print("(\(user) login success")
                        let alert = UIAlertController(title: "Notification", message: "Login success", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
//                        let sceneDelegate = SceneDelegate()
//                        sceneDelegate.setupRootViewTabbar()

                                
                       
                        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                           // to do
                            scene.setupRootViewTabbar()
                        }
                        
                        
                        break
                        // Đăng ký thành công, thực hiện xử lý tiếp theo
                    case .failure(let error):
                        // Xử lý lỗi
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
    

    @objc func labelTapped() {
        let signUp = SignUpViewController()
        navigationController?.pushViewController(signUp, animated: true)
       }
}
