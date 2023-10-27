//
//  SignUpViewController.swift
//  SportNews0210
//
//  Created by Minh Triet Pham on 05/10/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    //    @IBOutlet weak var backgroundSignUpVIew: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        backgroundSignUpVIew.layer.cornerRadius = 50
        // Do any additional setup after loading the view.
    }


    
    @IBAction func buttonSignUpTapped(_ sender: Any) {
        guard let email = userNameTextField.text, let password = passwordTextField.text else {
                    return
                }
                
                let user = UserInputData(email: email, password: password)
                
                AuthViewModel.shared.signUp(user: user) { result in
                    switch result {
                    case .success(let user): 
                        print("\(user) sign up success")
                        let alert = UIAlertController(title: "Notification", message: "Sign up success", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                        // Đăng ký thành công, thực hiện xử lý tiếp theo
                    case .failure(let error):
                        // Xử lý lỗi
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
    
    
}
