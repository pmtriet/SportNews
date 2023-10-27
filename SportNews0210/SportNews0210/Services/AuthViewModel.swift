//
//  UserService.swift
//  SportNews0210
//
//  Created by Minh Triet Pham on 26/10/2023.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthViewModel {
//    @Published var userSession: User?
    static let shared = AuthViewModel()
    private init() {}
    
//    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
//            Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
//                if let user = authResult?.user {
//                    print(user)
//                    completionBlock(true)
//                } else {
//                    completionBlock(false)
//                }
//            }
//        }
    func signUp(user: UserInputData, completion: @escaping (Result<UserInputData, Error>) -> Void) {
            Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
                if let user = authResult?.user {
                    completion(.success(UserInputData(email: user.email ?? "", password: "")))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
        }
    func login(user: UserInputData, completion: @escaping (Result<UserInputData, Error>) -> Void) {
            Auth.auth().signIn(withEmail: user.email, password: user.password) { authResult, error in
                if let user = authResult?.user {
                    completion(.success(UserInputData(email: user.email ?? "", password: "")))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
        }
//    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
//        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
//            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
//                completionBlock(false)
//            } else {
//                completionBlock(true)
//            }
//        }
//        Auth.auth().signIn(withEmail: "user@email.com", password: "PASSWORD******") { (user, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            else if let user = user {
//                print(user.uid)
//            }
//        }
//    }
//func login(withUser user: UserInputData, completion: @escaping (Result<Void, Error>) -> Void) {
//        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
//            if let error = error {
//                print("DEBUG: Failed to login, (error.localizedDescription)")
//                completion(.failure(error))
//                return
//            }
//
//            guard let loggedInUser = result?.user else {
//                let customError = NSError(domain: "YourAppErrorDomain", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to get logged-in user"])
//                print("DEBUG: Failed to get logged-in user.")
//                completion(.failure(customError))
//                return
//            }
//
//            self.userSession = loggedInUser
//            self.fetchUser() // Assuming this function fetches user data
//
//            print("DEBUG: Logged in successfully, (String(describing: self.userSession?.uid)).")
//            completion(.success(()))
//        }
//    }
 }
