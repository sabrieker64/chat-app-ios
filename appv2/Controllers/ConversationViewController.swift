//
//  ViewController.swift
//  appv2
//
//  Created by Sabri Samed Eker on 04.02.23.
//

import UIKit
import FirebaseAuth

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        validateAuth()
    }
    
    
    private func validateAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }else {
          

        }
    }

}

