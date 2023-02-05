//
//  ViewController.swift
//  appv2
//
//  Created by Sabri Samed Eker on 04.02.23.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let loggedIn = UserDefaults.standard.bool(forKey: "loggedIn")
        
        if !loggedIn {
            let vc = LoginViewController();
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }

}

